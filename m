Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A040EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 18:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ks97GH2LaTpmBHlOixhFxXkuBIXI335Wni2pKXTuyX4=; b=KVtKErVvOxkZXC9a9HhOXGm4n/
	OZpwJrtGAfIvCW3nRoV3Ildirgs5wHOTM8HYKkA0iAsEZAHa7KMz/6mjNV1IPV7LTaURKf+NMyO7M
	pRFpBkd1qgaGhmOr9nhLl3fGkUGeL732Ey6yHEmnfCcXuas5Ql8nMEewudG/ZFUHxiuTj4EGqTAsZ
	8TMiDHqlzRzfmCULyZubcYKhHJFtiHMQczKs8IsfJTVKuwNE30hn4/hMNaEYwVAEWCMRcarU3N+Wy
	b8UpRCJlYJ9QSJP+VgcUu/fWhR4R2v319K9vrz1BD2+HgwlKj+IMNcPTJMxDVJpVBfvFh2KG7tZUG
	pCr3qzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJS6-009B29-2f;
	Mon, 19 Jun 2023 18:18:10 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJS3-009B1I-1a
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 18:18:09 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666e64e97e2so1925561b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687198686; x=1689790686;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/SHBpdKZgdBeJzvic1Y0EA5p8DJ5QT0ObZuhfz/k8c=;
        b=GW4jS7jhWSMeSUdBK6UMp0g0Fm+9iEea8nPsnJ8MaoOSqbCTnj/47f+q1xZimgob4Z
         PMOl9DTbr8J9NOMArqY1EaudZ9erdQWrUPsfRADAp2Mc707Cpnear3uICPofefE7012E
         kkHDX/Bf6UyQCMD8obF3Bzvr2zqT/Rzz4aBQPiVeTRZdUJNk/gEg8fOhyzf/qkK2OqCl
         KJYrRUx7LVIgs+dVooF8LDemOH9WbGDtstta9vudZ9HQQkyvBmzxmbMqWxSnX3ub0HSJ
         tAXf9g35+/7oZy4BTuKySeqb/O2ImepUkyb5PhLnHpG+50MTp3KzlDwsDKFJ48+QyIRZ
         l5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687198686; x=1689790686;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/SHBpdKZgdBeJzvic1Y0EA5p8DJ5QT0ObZuhfz/k8c=;
        b=acFuGQn0hg51w78pR3sKpzPGweb/EGgI9Rnsp4sd4+RIMNUr2swPoTonm4tQr69eQ7
         tVm4DZ6xictIKFWNIxm35qrz431zs6fjzwdSCgd/4mjgZMSAnPHBYn0XoI86af0Mot+6
         w8b3iPgiPuvCgYbZlRoTU5VCNFz+5PJsJQS27n2xHipOBEYMYAohUokecDzmnf776OZJ
         xYSvaBzo+qnBf38r3orG381i+Yba9HLZkPYJpJgAGckeuKv1PvC2cZqGyWlICvGU/G/1
         fUU1HKdXo0mzDhrbawACyswLSUrQFY/ahvmOX9MVvSPuNSZpuQDLqF5FP10YykEjbLM4
         24yg==
X-Gm-Message-State: AC+VfDzmPB2iEWpZc1daIAtxwo/nNgLCdCKPjTFW4khZzC8HPe8HTrtT
	HitTIZMNS/33OxNVebjKTkCv2cy3l1HNSxB2B3o=
X-Google-Smtp-Source: ACHHUZ7UfoGyK/hV4m2pTufu5DTWsqqCAQ6imc34lDZZHSQCvWGnJs6WEMDAyB/icjvu8UZc/9M67A==
X-Received: by 2002:a05:6a20:c789:b0:107:1f22:10d5 with SMTP id hk9-20020a056a20c78900b001071f2210d5mr8877164pzb.52.1687198686177;
        Mon, 19 Jun 2023 11:18:06 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001b51630d0absm158667plo.91.2023.06.19.11.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 11:18:05 -0700 (PDT)
Date: Mon, 19 Jun 2023 11:18:05 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Jun 2023 11:17:55 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <87sfar2mld.fsf@all.your.base.are.belong.to.us>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: bjorn@kernel.org
Message-ID: <mhng-8d1b80c9-10f4-448b-9e9d-31a1c969393f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_111807_526538_F6A02167 
X-CRM114-Status: GOOD (  31.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNiBKdW4gMjAyMyAxMzoxMjoxNCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+
Cj4+IFRoZSBWIHJlZ2lzdGVycyBhcmUgY2xvYmJlcmVkIGJ5IHN0YW5kYXJkIEFCSSBmdW5jdGlv
bnMsIHNvIHVzZXJzcGFjZQo+PiBwcm9iYWJseSBkb2Vzbid0IGhhdmUgYW55dGhpbmcgdXNlZnVs
IGluIHRoZW0gYnkgdGhlIHRpbWUgd2UgZ2V0IHRvIHRoZQo+PiBrZXJuZWwuICBTbyBsZXQncyBq
dXN0IGRvY3VtZW50IHRoYXQgdGhleSdyZSBjbG9iYmVyZWQgYnkgc3lzY2FsbHMgYW5kCj4+IHBy
b2FjdGl2ZWx5IGNsb2JiZXIgdGhlbS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJl
bHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiBJSVJDIHdlJ2QgdGFsa2VkIGFib3V0
IGRvaW5nIHRoaXMsIGJ1dCBJIGRpZG4ndCBzZWUgYW55dGhpbmcgaW4gdGhlCj4+IGRvY3MuICBJ
IGZpZ3VyZSBpdCdzIGJldHRlciB0byBqdXN0IHByb2FjdGl2ZWx5IGNsb2JiZXIgdGhlIHJlZ2lz
dGVycyBvbgo+PiBzeXNjYWxscywgYXMgdGhhdCB3YXkgdXNlcnNwYWNlIGNhbid0IGVuZCB1cCBh
Y2NpZGVudGFsbHkgZGVwZW5kaW5nIG9uCj4+IHRoZW0uCj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlv
bi9yaXNjdi92ZWN0b3IucnN0IHwgNSArKysrKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YyAgICAgIHwgMiArKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvdmVjdG9yLnJzdCBiL0RvY3VtZW50YXRp
b24vcmlzY3YvdmVjdG9yLnJzdAo+PiBpbmRleCA0OGYxODlkNzllNDEuLmE0ZGZhOTU0MjE1YiAx
MDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0b3IucnN0Cj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vcmlzY3YvdmVjdG9yLnJzdAo+PiBAQCAtMTMwLDMgKzEzMCw4IEBAIHByb2Nl
c3NlcyBpbiBmb3JtIG9mIHN5c2N0bCBrbm9iOgo+PiAgCj4+ICAgICAgTW9kaWZ5aW5nIHRoZSBz
eXN0ZW0gZGVmYXVsdCBlbmFibGVtZW50IHN0YXR1cyBkb2VzIG5vdCBhZmZlY3QgdGhlIGVuYWJs
ZW1lbnQKPj4gICAgICBzdGF0dXMgb2YgYW55IGV4aXN0aW5nIHByb2Nlc3Mgb2YgdGhyZWFkIHRo
YXQgZG8gbm90IG1ha2UgYW4gZXhlY3ZlKCkgY2FsbC4KPj4gKwo+PiArMy4gIFZlY3RvciBSZWdp
c3RlciBTdGF0ZSBBY3Jvc3MgU3lzdGVtIENhbGxzCj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gKwo+PiArVmVjdG9yIHJlZ2lzdGVycyBhcmUgY2xv
YmJlcmVkIGJ5IHN5c3RlbSBjYWxscy4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+IGluZGV4IDA1ZmZkY2QxNDI0
ZS4uYmI5OWE2Mzc5YjM3IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
Cj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gQEAgLTI5NSw2ICsyOTUsOCBA
QCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxf
dShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gIAkJcmVncy0+ZXBjICs9IDQ7Cj4+ICAJCXJlZ3Mt
Pm9yaWdfYTAgPSByZWdzLT5hMDsKPj4gIAo+PiArCQlyaXNjdl92X3ZzdGF0ZV9vZmYocmVncyk7
Cj4+ICsKPgo+IE5vdCBvZmYsIHJpZ2h0PyBJc24ndCBpdCBfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFu
KCkgdGhhdCB5b3UnZCBsaWtlIHRvCj4gY2FsbD8gU29tZXRoaW5nIGxpa2U6Cj4KPiBzdGF0aWMg
dm9pZCB2c3RhdGVfZGlzY2FyZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiB7Cj4gICAgICAgIGlm
ICgocmVncy0+c3RhdHVzICYgU1JfVlMpID09IFNSX1ZTX0RJUlRZKQo+ICAgICAgICAgICAgICAg
IF9fcmlzY3Zfdl92c3RhdGVfY2xlYW4ocmVncyk7Cj4gfQo+Cj4gQ29tcGxlbWVudGVkIGJ5IGEg
IVYgY29uZmlnIHZhcmlhbnQuCgpJIHRoaW5rIGl0J3MganVzdCBhIHF1ZXN0aW9uIG9mIHdoYXQg
d2UncmUgdHJ5aW5nIHRvIGRvIGhlcmU6IGNsZWFuIAphdm9pZHMgdGhlIGtlcm5lbCBWIHN0YXRl
IHNhdmUsIGJ1dCB1bmxlc3MgdGhlIGtlcm5lbCBkZWNpZGVzIHRvIHVzZSBWIApkdXJpbmcgdGhl
IHN5c2NhbGwgdGhlIHJlZ2lzdGVyIGNvbnRlbnRzIHdpbGwgc3RpbGwgYmUgdXNhYmxlIGJ5IAp1
c2Vyc3BhY2UuICBNYXliZSB0aGF0J3MgZmluZSBhbmQgd2UgY2FuIGp1c3QgcmVseSBvbiB0aGUg
SVNBIHNwZWMsIAp0aG91Z2g/ICBJIHNlbnQgYW5vdGhlciBwYXRjaCB0byBqdXN0IGRvY3VtZW50
IGl0IGluIExpbnV4LCBldmVuIGlmIGl0J3MgCmluIHRoZSBJU0Egc3BlYyBpdCBzZWVtcyB3b3J0
aCBoYXZpbmcgaW4gdGhlIGtlcm5lbCBhcyB3ZWxsLgoKVGhhdCBzYWlkLCBJIHRoaW5rIHRoZSBy
aWdodCB0aGluZyB0byBkbyBoZXJlIG1pZ2h0IGJlIHRvIHplcm8gdGhlIFYgCnJlZ2lzdGVyIHN0
YXRlIGFuZCBzZXQgaXQgdG8gaW5pdGlhbDogdGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNw
YWNlIApmcm9tIGFjY2lkZW50YWxseSByZWx5aW5nIG9uIHRoZSBzdGF0ZSBzYXZlLCBidXQgd2Ug
Y2FuIGFsc28gYXZvaWQgdGhlIAp0cmFwIHRoYXQgd291bGQgY29tZSBmcm9tIHR1cm5pbmcgaXQg
b2ZmLiAgVGhhdCBsZXRzIHVzIGdpdmUgdGhlIApoYXJkd2FyZSBhIG5pY2UgY2xlYW4gaW5kaWNh
dGlvbiB3aGVuIHRoZSBWIHN0YXRlIGlzbid0IGluIHVzZSwgd2hpY2ggCndpbGwgaG9wZWZ1bGx5
IGhlbHAgdXMgYXZvaWQgdGhlIHNhdmUvcmVzdG9yZSBwZXJmb3JtYW5jZSBpc3N1ZXMgdGhhdCAK
b3RoZXIgcG9ydHMgaGF2ZSBoaXQuCgpJIHRoaW5rIHRoZSBpc3N1ZSB3aXRoIHplcm9pbmcgdGhl
IHJlZ2lzdGVycyBpbiB0aGF0IGl0IG1heSBiZSBzbG93IG9uIApzb21lIGltcGxlbWVudGF0aW9u
cywgYXMgaXQgcmVxdWlyZXMgYSBidW5jaCBvZiBWIHJlZ2lzdGVyIHdyaXRlcyBhbmQgCnRob3Nl
IGNvdWxkIGJlIG11bHRpLWN5Y2xlLiAgSSdkIGxlYW4gdG93YXJkcyBkb2luZyB0aGUgemVyb2lu
ZyBub3csIGFzIAppdCdsbCBtYWtlIHN1cmUgdXNlcnNwYWNlIHJlc3BlY3RzIHRoZSB1QUJJIGFu
ZCB3ZSBkb24ndCBoYXZlIGFueSBIVyB0byAKbWVhc3VyZSB0aGUgcGVyZm9ybWFuY2Ugb24uICBN
YXliZSB0aGUgemVyb2luZyB3aWxsIGJlIGVub3VnaCB0byBnZXQgSFcgCnRvIG1ha2UgdGhhdCBm
YXN0LCBpZiBub3Qgd2UgY2FuIGFsd2F5cyByb2xsIGl0IGJhY2sgd2hlbiBIVyBzdGFydHMgCnNo
b3dpbmcgdXAuCgpUaGVyZSdzIGFsc28gc29tZSBxdWVzdGlvbnMgYXMgdG8gd2hldGhlciBvciBu
b3QgSFcgaXMgZ29pbmcgdG8gYm90aGVyIApyZXNwZWN0aW5nIHRoZSBpbnRlcm1lZGlhdGUgc3Rh
dGVzLCBhcyBJSVJDIGl0J3MgcHJldHR5IGNvbW1vbiBmb3IgSFcgdG8gCmlnbm9yZSB0aGVtIGZv
ciB0aGUgRi9EIGV4dGVuc2lvbnMgKGF0IGxlYXN0IHRoZSBvbGQgU2lGaXZlIGNvcmVzIGRvKS4g
IApJIHRoaW5rIHRoZXJlJ3MganVzdCBub3QgYSB3aG9sZSBsb3Qgd2UgY2FuIGRvIHRoZXJlLCBI
VyB0aGF0IAppbmFjY3VyYXRlbHkgdHJhY2tzIHRoZSBtZXRhZGF0YSB3aWxsIGp1c3QgZW5kIHVw
IHdpdGggbW9yZSAKc2F2ZS9yZXN0b3JlIHRpbWUuCgo+IEJqw7Zybgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
