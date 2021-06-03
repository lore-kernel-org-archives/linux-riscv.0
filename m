Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EA8C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 13:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781A56101C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 13:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 781A56101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwms3g60MNm3MQMtkDwOoIdIFntUuc8DJuU8hhPTh98=; b=2t8DzSJBfh1G5P
	2KBQAouRkC/WF0gnkYn5Z9Y6xfnhn8SJkBM9ypBefivtzDJm2cK0T9tUl1piQMYB3NhYkKrrfwcp3
	BQcdf9bcc1uHCNY3e8yX3+sxRrM+EFJ5RDKy+I9rjDI4aY6VAK83jcNdwFA0OYIYhCn3CLR1UZgLD
	WxTkjD6BIz4sdBYjAiLoTQcEPBfAIlOz1StTwVlrCTkZkP1cfcyGo2UsnS5vO6QjYeLEMkoYKE6hD
	olng4lsMI7UZ7GvxJnHBMQia7AicGFBe7TQVwf1OkXPdq0DCxIj+QOabxWrdXX+H+BGg1p0VbYI7S
	GhKySvAXCrm9q2LSyWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lonEi-008ujc-GA; Thu, 03 Jun 2021 13:18:12 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lonEb-008ui3-Cf
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 13:18:10 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5874700wmh.4
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jun 2021 06:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kVmiKNflK1YqQSK946ogFvaiqc4a4AwLLd7mkDQytwo=;
 b=KJfWoDsEFR+xkEK8fqCohWR3iG7FC4MQxI4/FZw1BOExXFJsTBny46F7WkLIlQrq/z
 4AjURLtXA8XG8BT4KscUQ35iWl5jD2Dhn2rRidpH7DCPFD1p4A/O66X+nQXGZrqvMxUt
 GO15rY79//UX2QnH7WBOaIKaM62LKki0oZjQ0/UcqMR7obCyxXO3hBLQ/qcQ+d/olBG/
 M8cvlZ9YRvx0JcwB+Z/Aq4YjlSceH9SP1xlDIe6csU0ynlhoo+KBs61YofWZUWGwcHEw
 WQ4qZy99ys4wp6RNmahLclCMS7RByU7fQglZO99NQJkNOp8hZzVdS6BHf93AcqSCbow3
 lmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kVmiKNflK1YqQSK946ogFvaiqc4a4AwLLd7mkDQytwo=;
 b=kY2wiOsVnFDTQlycF30yO4XmSh5WXqUDYWjZQAOE412hVbo/NTXV5YS3rJcrPcokbK
 0qEDhblMjW8dXk/aGNhY+jAJNfJ7fH3oyLOxRHT2ubFuHt+HB4j0IqRzLZhW7jb2rRXc
 sY0wsU8b2gC0mivtdVClBCSraQhvvNAWp5EB67a+m4AnTBHj+f1ukHqwgDV3rmmAOKF4
 PMyjODIqL4kLj/9SKbcHBM1eHJvmuJCCCnn1Cj1EV18IDApugqepRU7OMZxLjwYNfj0v
 rGPK9Or8/Byuiy94M8cx9OD5kQvgx77Z10vgvIxgJ2r0xQONiycCzyJtanTiLxJvMxdA
 zkvg==
X-Gm-Message-State: AOAM530mMbgk1/AnbesouC/1ZouWlDwJ/gpuFmDKMRDzUCwWwdyePRVI
 /DgR7f24NG36G9ub5EGLSQY9HLOCOKFMsUZ9gm8ETQ==
X-Google-Smtp-Source: ABdhPJwrJsJZtC2CbERI2DymWgVkybpTdH/lrVRKG7SsyTSoC3smHhOZwAum9hW1SYerXRcZcLvaDywUzdNnakDxmlM=
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr10350874wmq.152.1622726220166; 
 Thu, 03 Jun 2021 06:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210603082749.1256129-1-alex@ghiti.fr>
 <20210603082749.1256129-2-alex@ghiti.fr>
 <20210603202748.2775f739@xhacker>
 <64cdb4f9-06f0-59b9-acf9-6fc298db37d7@ghiti.fr>
In-Reply-To: <64cdb4f9-06f0-59b9-acf9-6fc298db37d7@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 3 Jun 2021 18:46:47 +0530
Message-ID: <CAAhSdy2kPPrBzFCA01NSvWptoftY27+PsMzLDWFzvOzNdUByhA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: Factorize xip and !xip kernel address
 conversion macros
To: Alex Ghiti <alex@ghiti.fr>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Zong Li <zong.li@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_061805_514125_157F19F8 
X-CRM114-Status: GOOD (  27.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMywgMjAyMSBhdCA2OjI3IFBNIEFsZXggR2hpdGkgPGFsZXhAZ2hpdGkuZnI+
IHdyb3RlOgo+Cj4gSGkgSmlzaGVuZywKPgo+IExlIDMvMDYvMjAyMSDDoCAxNDoyNywgSmlzaGVu
ZyBaaGFuZyBhIMOpY3JpdCA6Cj4gPiBPbiBUaHUsICAzIEp1biAyMDIxIDEwOjI3OjQ3ICswMjAw
Cj4gPiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4KPiA+PiBUbyBz
aW1wbGlmeSB0aGUga2VybmVsIGFkZHJlc3MgY29udmVyc2lvbiBjb2RlLCBtYWtlIHRoZSBzYW1l
IGRlZmluaXRpb24gb2YKPiA+PiBrZXJuZWxfbWFwcGluZ19wYV90b192YSBhbmQga2VybmVsX21h
cHBpbmdfdmFfdG9fcGEgY29tcGF0aWJsZSBmb3IgYm90aCB4aXAKPiA+PiBhbmQgIXhpcCBrZXJu
ZWwgYnkgZGVmaW5pbmcgWElQX09GRlNFVCB0byAwIGluICF4aXAga2VybmVsLgo+ID4+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+ID4+IC0tLQo+
ID4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggICAgfCAxNCArKystLS0tLS0tLS0t
LQo+ID4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAgMiArKwo+ID4+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4+Cj4g
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wYWdlLmgKPiA+PiBpbmRleCA2YTc3NjFjODZlYzIuLjZlMDA0ZDhmZGE0
ZCAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+ID4+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gPj4gQEAgLTkzLDkgKzkzLDcgQEAg
ZXh0ZXJuIHVuc2lnbmVkIGxvbmcgdmFfcGFfb2Zmc2V0Owo+ID4+ICAgI2lmZGVmIENPTkZJR182
NEJJVAo+ID4+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgdmFfa2VybmVsX3BhX29mZnNldDsKPiA+
PiAgICNlbmRpZgo+ID4+IC0jaWZkZWYgQ09ORklHX1hJUF9LRVJORUwKPiA+PiAgIGV4dGVybiB1
bnNpZ25lZCBsb25nIHZhX2tlcm5lbF94aXBfcGFfb2Zmc2V0Owo+ID4+IC0jZW5kaWYKPiA+PiAg
IGV4dGVybiB1bnNpZ25lZCBsb25nIHBmbl9iYXNlOwo+ID4+ICAgI2RlZmluZSBBUkNIX1BGTl9P
RkZTRVQgICAgICAgICAgICAocGZuX2Jhc2UpCj4gPj4gICAjZWxzZQo+ID4+IEBAIC0xMDMsNiAr
MTAxLDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgcGZuX2Jhc2U7Cj4gPj4gICAjaWZkZWYgQ09O
RklHXzY0QklUCj4gPj4gICAjZGVmaW5lIHZhX2tlcm5lbF9wYV9vZmZzZXQgICAgICAgIDAKPiA+
PiAgICNlbmRpZgo+ID4+ICsjZGVmaW5lIHZhX2tlcm5lbF94aXBfcGFfb2Zmc2V0IDAKPiA+PiAg
ICNkZWZpbmUgQVJDSF9QRk5fT0ZGU0VUICAgICAgICAgICAgKFBBR0VfT0ZGU0VUID4+IFBBR0Vf
U0hJRlQpCj4gPj4gICAjZW5kaWYgLyogQ09ORklHX01NVSAqLwo+ID4+Cj4gPj4gQEAgLTExMCwy
OSArMTA5LDIyIEBAIGV4dGVybiB1bnNpZ25lZCBsb25nIGtlcm5lbF92aXJ0X2FkZHI7Cj4gPj4K
PiA+PiAgICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+PiAgICNkZWZpbmUgbGluZWFyX21hcHBpbmdf
cGFfdG9fdmEoeCkgKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKSh4KSArIHZhX3BhX29mZnNldCkp
Cj4gPj4gLSNpZmRlZiBDT05GSUdfWElQX0tFUk5FTAo+ID4+ICAgI2RlZmluZSBrZXJuZWxfbWFw
cGluZ19wYV90b192YSh5KSAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPj4gICAgICB1bnNpZ25lZCBsb25nIF95ID0geTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiAgICAgIChf
eSA+PSBDT05GSUdfUEhZU19SQU1fQkFTRSkgPwo+ID4KPiA+IFRoaXMgQ09ORklHX1BIWVNfUkFN
X0JBU0UgaXMgb25seSBhdmFpbGFibGUgZm9yIFhJUCwgY291bGQgcmVzdWx0IGluIGEKPiA+IGNv
bXBpbGVyIGVycm9yIGZvciAhWElQPwo+Cj4gWW91J3JlIHJpZ2h0LCBJIGhhdmUgdGhpcyBwYXRj
aCBpbiBteSBicmFuY2ggYW5kIGZvcmdvdCB0byBzcXVhc2ggaXQuCj4KPiA+Cj4gPiBJJ20gYWxz
byBjb25jZXJuZWQgd2l0aCB0aGUgdW5lY2Vzc2FyeSBvdmVyaGVhZCBvZiBrZXJuZWxfbWFwcGlu
Z19wYV90b192YSgpCj4gPiBmb3IgIVhJUCBjYXNlLCB0aGVyZSdzIGEgImlmIiBjb25kaXRpb24g
YnJhbmNoLCBhbmQgZXh0cmEgc3ltYm9sOiB2YV9rZXJuZWxfeGlwX3BhX29mZnNldAo+Cj4gSSB1
bmRlcnN0YW5kIHlvdXIgY29uY2VybnMgZXZlbiBpZiBJIGRvbid0IGZpbmQgdGhhdCB0aGUgb3Zl
cmhlYWQgaXMKPiB0aGF0IGltcG9ydGFudCBoZXJlLCBJIHByZWZlciB0aGUgcmVhZGFiaWxpdHkg
aW1wcm92ZW1lbnQuIEkgY2FuIGFsd2F5cwo+IGFkZCB1bmxpa2VseS9saWtlbHkgYnVpbHRpbiB0
byBpbXByb3ZlIHRoaW5ncyBvciBjb21wbGV0ZWx5IHJlbW92ZSB0aGlzCj4gcGF0Y2ggaWYgb3Ro
ZXJzIGFncmVlIHdpdGggeW91LgoKSSB3b3VsZCBhbHNvIHByZWZlciByZWFkYWJsZSBjb2RlIGZv
ciBsb25nLXRlcm0gbWFpbnRhaW5hYmlsaXR5LiBDdXJyZW50bHksCnRoZSBuZXN0ZWQgIiNpZmRl
ZnMiIGFyZSBpbmNyZWFzaW5nIGNhdXNpbmcgZGV2ZWxvcGVycyB0byBlYXNpbHkgYnJlYWsKdW50
ZXN0ZWQgY29tYmluYXRpb25zLgoKUmVnYXJkcywKQW51cAoKPgo+IFRoYW5rcywKPgo+IEFsZXgK
Pgo+ID4KPiA+PiAgICAgICAgICAgICAgKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpKF95KSArIHZh
X2tlcm5lbF9wYV9vZmZzZXQgKyBYSVBfT0ZGU0VUKSA6ICAgICAgXAo+ID4+ICAgICAgICAgICAg
ICAodm9pZCAqKSgodW5zaWduZWQgbG9uZykoX3kpICsgdmFfa2VybmVsX3hpcF9wYV9vZmZzZXQp
OyAgICAgICAgICAgICAgICBcCj4gPj4gICAgICB9KQo+ID4+IC0jZWxzZQo+ID4+IC0jZGVmaW5l
IGtlcm5lbF9tYXBwaW5nX3BhX3RvX3ZhKHgpICAoKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpKHgp
ICsgdmFfa2VybmVsX3BhX29mZnNldCkpCj4gPj4gLSNlbmRpZgo+ID4+ICAgI2RlZmluZSBfX3Bh
X3RvX3ZhX25vZGVidWcoeCkgICAgICAgICAgICAgIGxpbmVhcl9tYXBwaW5nX3BhX3RvX3ZhKHgp
Cj4gPj4KPiA+PiAgICNkZWZpbmUgbGluZWFyX21hcHBpbmdfdmFfdG9fcGEoeCkgKCh1bnNpZ25l
ZCBsb25nKSh4KSAtIHZhX3BhX29mZnNldCkKPiA+PiAtI2lmZGVmIENPTkZJR19YSVBfS0VSTkVM
Cj4gPj4gICAjZGVmaW5lIGtlcm5lbF9tYXBwaW5nX3ZhX3RvX3BhKHkpICh7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiAgICAgIHVuc2lnbmVkIGxv
bmcgX3kgPSB5OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+PiAgICAgIChfeSA8IGtlcm5lbF92aXJ0X2FkZHIgKyBYSVBfT0ZGU0VUKSA/ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiAgICAgICAgICAgICAgKCh1bnNp
Z25lZCBsb25nKShfeSkgLSB2YV9rZXJuZWxfeGlwX3BhX29mZnNldCkgOiAgICAgICAgICAgICAg
IFwKPiA+PiAgICAgICAgICAgICAgKCh1bnNpZ25lZCBsb25nKShfeSkgLSB2YV9rZXJuZWxfcGFf
b2Zmc2V0IC0gWElQX09GRlNFVCk7ICAgICAgIFwKPiA+PiAgICAgIH0pCj4gPgo+ID4gU2ltaWxh
ciBhcyBrZXJuZWxfbWFwcGluZ19wYV90b192YSgpLCBhbiBvdmVyaGVhZCBvZiAiaWYiIGNvbmRp
dGlvbiBicmFuY2gKPiA+IGZvciAhWElQIGFuZCBleHRyYSB2YV9rZXJuZWxfeGlwX3BhX29mZnNl
dCBzeW1ib2wuCj4gPgo+ID4+IC0jZWxzZQo+ID4+IC0jZGVmaW5lIGtlcm5lbF9tYXBwaW5nX3Zh
X3RvX3BhKHgpICAoKHVuc2lnbmVkIGxvbmcpKHgpIC0gdmFfa2VybmVsX3BhX29mZnNldCkKPiA+
PiAtI2VuZGlmCj4gPj4gKwo+ID4+ICAgI2RlZmluZSBfX3ZhX3RvX3BhX25vZGVidWcoeCkgICAg
ICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPj4g
ICAgICB1bnNpZ25lZCBsb25nIF94ID0geDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPj4gICAgICAoX3ggPCBrZXJuZWxfdmlydF9hZGRyKSA/
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPj4gQEAg
LTE0MSw3ICsxMzMsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBrZXJuZWxfdmlydF9hZGRyOwo+
ID4+ICAgI2Vsc2UKPiA+PiAgICNkZWZpbmUgX19wYV90b192YV9ub2RlYnVnKHgpICAoKHZvaWQg
KikoKHVuc2lnbmVkIGxvbmcpICh4KSArIHZhX3BhX29mZnNldCkpCj4gPj4gICAjZGVmaW5lIF9f
dmFfdG9fcGFfbm9kZWJ1Zyh4KSAgKCh1bnNpZ25lZCBsb25nKSh4KSAtIHZhX3BhX29mZnNldCkK
PiA+PiAtI2VuZGlmCj4gPj4gKyNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KPiA+Pgo+ID4+ICAg
I2lmZGVmIENPTkZJR19ERUJVR19WSVJUVUFMCj4gPj4gICBleHRlcm4gcGh5c19hZGRyX3QgX192
aXJ0X3RvX3BoeXModW5zaWduZWQgbG9uZyB4KTsKPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aAo+ID4+IGluZGV4IGJkZThjZTNiZmU3Yy4uZDk4ZTkzMWEzMWU1IDEwMDY0NAo+ID4+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+PiBAQCAtNzcsNiArNzcsOCBAQAo+ID4+Cj4gPj4gICAj
aWZkZWYgQ09ORklHX1hJUF9LRVJORUwKPiA+PiAgICNkZWZpbmUgWElQX09GRlNFVCAgICAgICAg
IFNaXzhNCj4gPj4gKyNlbHNlCj4gPj4gKyNkZWZpbmUgWElQX09GRlNFVCAgICAgICAgICAwCj4g
Pj4gICAjZW5kaWYKPiA+Pgo+ID4+ICAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiA+Cj4gPgo+ID4K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBs
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
