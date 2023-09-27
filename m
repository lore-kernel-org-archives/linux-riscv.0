Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497F2E82CBB
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHt9vxpxy36F0x8deFAg5nTb8V47HKh+40wF+2LhioM=; b=X08ymgTLO/7O1y
	iWMv/5KysFuDkRxzeZVuM4fchlbMV8/piACeAWbVNU9AWtcdQcqSAYmNWMrWhCe+zSDalwDs7FJuZ
	vbbFnYMUBcKNJdASAlgoMM5Ewd0YIC76NTuISEI5tj7exwxDMzpA1kkAS4glk6OiDxe8StPwMdBRk
	nP3sPnjYaorq9RwLM/3BEi2qXyz30Wvz068lJMA+94dMIjX4ylKsIF7uAw2MnFJ4p8mb388uulBsn
	KrlAAUyNAYlUJxIadoRMDFHyTivbgVigFJN0d8WBH+jrTjmtAO/MZ33S9KP1UswRTYn5IKM2PY4Ta
	StpriS/fly7Z86ezxlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlZWr-001b5Q-21;
	Wed, 27 Sep 2023 18:44:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlZWn-001b3x-1i
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 18:44:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40572aeb673so89046565e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1695840284; x=1696445084; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+uiTOmGSxLchBRjvKV/vrfTnBZdrMZ5XZFVPvVP6Hk=;
        b=LG59HbePBqLwLW7S0LFx0U0aFLE+pNOp/pZNXfCwpZuteZHQTEnjIXcXHS/DO/tXHQ
         yfwfxFrmZcaasiECwTRxB8vLpGgNwxPe2/xKgdaMizrRLQQJ86gomEmRwXvqtxzujxo+
         E/xalbP/Nc4IFvqdIpS+uIbH1nake91E/fGzzGSNcvtlfgRyeXikOpJsGfliA66/idjv
         hDIuKvjHG2+z5fE4M3YMgRp04H7gZiwO1rBa5cDjCcNF52JjXBKrvdWkeH5B/ywpdEXg
         IQ9dgi6++WxI+fOK1naJPFYmsqubb4vy/QqqVv4blNc1eiAQD1ulT0ZtIKszWLmS5pZ7
         qqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695840284; x=1696445084;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+uiTOmGSxLchBRjvKV/vrfTnBZdrMZ5XZFVPvVP6Hk=;
        b=wI/8rqwhCXK6/biS5bg2VFi4uL1Z2M81opafcLkdHI9HQcHinrgTa1LtHcetoWxCc3
         G7VOI1jIvgQOOzG6avOIFjYUnLxk6Z0C92EsLct7z/3CRxQIqbx1BzMsAh3ABka7UDB9
         +oYCplHNV9M2niDFgRtHJ+bTdRfgOd5lEioClW73N6qShhLs01exDJB1byMQAD3UOObh
         3v28ZaPrmQ0sXeVWFc47q+Me6wVlpn3UIfeON1HT9P16SmrDUv65HIsKVPsrydgma2Y0
         +Txweky3Q5AcIfbJueaSzKXho6yRZ8x7uwskfR386STO7YWuLiRuIlA42bBEkWwPH2sr
         9fzQ==
X-Gm-Message-State: AOJu0YweUEuSy5HGA7M5k0XDnGiK7HcYxIsMr/2SYLWpHlKFPEQm2ZcI
	MjUfETcHrTGfAPzrktrKR3LRcQ==
X-Google-Smtp-Source: AGHT+IFCLPPlB8l+AVBO1lOEzvQO9ZomJNTtfFASLwJfuG+u2aKneFh1WB8sF2W/Vs55+CkE9Ewd9A==
X-Received: by 2002:a5d:444e:0:b0:320:7272:8fbe with SMTP id x14-20020a5d444e000000b0032072728fbemr2883194wrr.17.1695840283728;
        Wed, 27 Sep 2023 11:44:43 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id d5-20020a056000186500b00323384e04e8sm4735329wri.111.2023.09.27.11.44.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Sep 2023 11:44:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Svadu Entry
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <d141062b-e3e0-45ce-bc61-3404417c7d7c@app.fastmail.com>
Date: Wed, 27 Sep 2023 19:44:32 +0100
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 kvm-riscv@lists.infradead.org,
 Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Jinyu Tang <tjytimi@163.com>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Stefan O'Rear <sorear@fastmail.com>
Message-Id: <55289FD5-55F7-4EE6-BBCC-933B32770A95@jrtc27.com>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-3-yongxuan.wang@sifive.com>
 <d141062b-e3e0-45ce-bc61-3404417c7d7c@app.fastmail.com>
To: LKML <linux-kernel@vger.kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_114453_625522_E6010690 
X-CRM114-Status: GOOD (  23.23  )
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

T24gMjcgU2VwIDIwMjMsIGF0IDE4OjI0LCBTdGVmYW4gTydSZWFyIDxzb3JlYXJAZmFzdG1haWwu
Y29tPiB3cm90ZToKPiAKPiBPbiBGcmksIFNlcCAyMiwgMjAyMywgYXQgNDo1NiBBTSwgWW9uZy1Y
dWFuIFdhbmcgd3JvdGU6Cj4+IEFkZCBhbiBlbnRyeSBmb3IgdGhlIFN2YWR1IGV4dGVuc2lvbiB0
byB0aGUgcmlzY3YsaXNhLWV4dGVuc2lvbnMgcHJvcGVydHkuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5
OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+PiAtLS0KPj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDYg
KysrKysrCj4+IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIAo+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKPj4gaW5kZXggY2MxZjU0NmZkYmRjLi5iNWEwYWVkMDE2NWIgMTAwNjQ0Cj4+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbAo+PiBAQCAtMTQ3LDYgKzE0NywxMiBAQCBwcm9wZXJ0aWVzOgo+PiAgICAgICAg
ICAgICByYXRpZmllZCBhdCBjb21taXQgM2Y5ZWQzNCAoIkFkZCBhYmlsaXR5IHRvIG1hbnVhbGx5
IAo+PiB0cmlnZ2VyCj4+ICAgICAgICAgICAgIHdvcmtmbG93LiAoIzIpIikgb2YgcmlzY3YtdGlt
ZS1jb21wYXJlLgo+PiAKPj4gKyAgICAgICAgLSBjb25zdDogc3ZhZHUKPj4gKyAgICAgICAgICBk
ZXNjcmlwdGlvbjogfAo+PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFN2YWR1IHN1cGVydmlz
b3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciBoYXJkd2FyZSB1cGRhdGluZwo+PiArICAgICAgICAgICAg
b2YgUFRFIEEvRCBiaXRzIGFzIGZyb3plbiBhdCBjb21taXQgYjY1ZTA3YyAoIm1vdmUgdG8gRnJv
emVuCj4+ICsgICAgICAgICAgICBzdGF0ZSIpIG9mIHJpc2N2LXN2YWR1Lgo+PiArCj4gCj4gVGhp
cyBpcyBpbmNvbXBsZXRlIHdpdGhvdXQgYSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBiZWhhdmlvciBv
ZiB0aGUgSEFERSBiaXQgaW1wbGllZAo+IGJ5IHN2YWR1IGJlaW5nIHByZXNlbnQuCj4gCj4gVGhl
IHJhdGlmaWVkIFJWQTIwIHJlcXVpcmVzIHBhZ2UgdGFibGUgYWNjZXNzZXMgd2l0aCBBL0QgPSAw
IHRvIHRyYXAsIGluIG90aGVyCj4gd29yZHMgSEFERSA9IDAgZm9yIFJWQTIwIGNvbmZvcm1hbmNl
LiAgSWYgd2UgYXJlIHNlcmlvdXMgYWJvdXQgY29tcGF0aWJpbGl0eSwKPiBJIHRoaW5rIHRoYXQg
d2UgbmVlZCBwbGF0Zm9ybXMgdG8gYmUgYWJsZSB0byBjb25mb3JtIHRvIGJvdGggUlZBMjAgYW5k
IFJWQTIzLAo+IHdoaWNoIHJlcXVpcmVzIEhBREUgPSAwIGF0IGtlcm5lbCBlbnRyeSB3aXRoIGEg
U0JJIGNhbGwgdG8gc2V0IEhBREUgPSAxLiAgRm9yCj4gdGhlIHNhbWUgcmVhc29uIEtWTSBzaG91
bGQgcHJvYmFibHkgZGVmYXVsdCB0byBIQURFID0gMCBzbyB0aGF0IHRoZSBkZWZhdWx0Cj4gY29u
ZmlndXJhdGlvbiByZW1haW5zIGNvbmZvcm1hbnQgdG8gUlZBMjAuCgpJ4oCZdmUgZmlsZWQgaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXN2YWR1L2lzc3Vlcy8yMSB0byB0cmFjayB0aGlz
CmJyb2tlbiBJU0EgZGVzaWduLCBhcyBkaXNjdXNzZWQgb24gSVJDLgoKQXMgYSBGcmVlQlNEIFJJ
U0MtViBkZXZlbG9wZXIsIGFuZCBzb21ldGltZSByZXZpZXdlciBvZiBMaW51eCBSSVNDLVYKcGF0
Y2hlcywgdGhpcyBpcyBhIE5BSyBmcm9tIG1lIGZvciB0aGlzIElTQSBkZXNpZ24uIFdoaWNoIGRv
ZXMgYmVnIHRoZQpxdWVzdGlvbiBvZiBob3cgbXVjaCBzZW5zZSB0aGUgY3VycmVudCBSSVNDLVYg
cHJvY2Vzc2VzIG1ha2UsIGdpdmVuIGZvcgpmcmVlemluZyBhIHNwZWMgeW91IGp1c3QgbmVlZCB0
byBzZW5kIG91dCB0aGUgcmVsZXZhbnQgUkZDIHBhdGNoZXMsCnRoZXkgZG9u4oCZdCBhY3R1YWxs
eSBuZWVkIHRvIGhhdmUgYW55IHJldmlldyBmcm9tIHRoZSBwcm9qZWN0IGluCnF1ZXN0aW9uIHRo
YXQgc2F5cyBpdOKAmXMgYSBzZW5zaWJsZSBkZXNpZ24sIGluc3RlYWQgdHJlYXRpbmcgdGhhdCBh
cwpwYXJ0IG9mIHRoZSBwdWJsaWMgcmV2aWV3IHBlcmlvZCwgd2hlcmUgaXTigJlzIG11Y2ggaGFy
ZGVyIHRvCmZ1bmRhbWVudGFsbHkgY2hhbmdlIHRoZSBzcGVjLCBkZXNwaXRlIGJlaW5nIHRoZSBm
aXJzdCB0aW1lIG1vc3QgcGVvcGxlCnNlZSBpdCBvciB0YWtlIGl0IHNlcmlvdXNseSBhcyBhIHRo
aW5nIHRvIGxvb2sgYXQuIEluIG15IG9waW5pb24gdGhlcmUKaXMgYSBzZXJpb3VzIG5lZWQgZm9y
IGtub3dsZWRnZWFibGUgcGVvcGxlIG9uIHRoZSBzb2Z0d2FyZSBzaWRlIHRvCnJldmlldyB0aGUg
SVNBIGV4dGVuc2lvbiBhbmQgaXRzIGludGVyYWN0aW9uIHdpdGggc29mdHdhcmUgKmJlZm9yZSog
aXQKY2FuIGJlIGZyb3plbiBzbyB0aGF0IHRoZXNlIHRoaW5ncyBjYW4gYmUgZml4ZWQuIEFuZCBv
ZiBjb3Vyc2UsIGlmIHRoZXkKZG8gZ2V0IGZpeGVkIGR1cmluZy9hZnRlciBwdWJsaWMgcmV2aWV3
LCB3aGF0IGdvb2QgaXMgdGhlIGZyb3plbiBzdGF0ZQphbnl3YXksIGJlY2F1c2UgYSBzcGVjIHRo
YXQgY2hhbmdlcyBpcyBub3QgdmVyeSBmcm96ZW4uCgpCdXQgSeKAmW0gcHJvYmFibHkgcHJlYWNo
aW5nIHRvIHRoZSBjaG9pciBoZXJlIGFib3V0IFJJU0MtViBwcm9jZXNzZXMKYmVpbmcgdW5maXQg
Zm9yIHB1cnBvc2UuCgpKZXNzCgo+PiAgICAgICAgIC0gY29uc3Q6IHN2aW52YWwKPj4gICAgICAg
ICAgIGRlc2NyaXB0aW9uOgo+PiAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3ZpbnZhbCBzdXBl
cnZpc29yLWxldmVsIGV4dGVuc2lvbiBmb3IgZmluZS1ncmFpbmVkCj4+IC0tIAo+PiAyLjE3LjEK
Pj4gCj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
