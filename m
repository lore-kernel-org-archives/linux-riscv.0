Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27B6C3ABA2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	In-Reply-To:MIME-Version:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PR+XjrcvWahUFC5W4lYGacoA9Wh8oCF/3DZ+ITth5oU=; b=pKu733rwqK8LKeGp7JIBmcvjMp
	43Iw/02PluS50UWf5S+K/ye+ceCAV3nXDeqLJ5HBWc80an9i7tYAIJnV6LsLXXn6g+juRElC5BeQF
	IIjZdadCLr9Wk0mFZkhDGsVHsXrneALVHomWyoOFZOKiM2Gn8iaEUQcuyvyGkSjlRa9X5vZx/0+b2
	BcY5kPoG5EvCZb+r86xagrh8jTLH2EHphuZTJ3NEEdZjtOYR94RLWNF8PgFTwQ0SU45dgBJLWfGsI
	JMNL2lK1MdlIy+hPXoOmfxz6PDf3Lj4bOvSvvRV4QuzRIuLMGda4WNeDps9VEWJ8trOIOZJOdix4M
	fa9Pb4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqEws-00000004Vox-133G;
	Mon, 16 Sep 2024 16:51:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqEwn-00000004VnT-1k9q
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 16:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726505490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2knuAc4JfdgfD0GGQV3HD7eftU5nGDQgNyO8aqV01U=;
	b=P3tvTqfrQ874exGsQKrZ1wUAnE+t9Tg3Z3zmZlalCu/wuSmbxPNAUUQ4DzcLvwDDQXYjmW
	10+HYtsgBcXDZeU3HBr5N4WDIfA6JqJJCxeQDpxHmMyKpD1qD2Oia/wySazkN5xWoUQLWN
	FYxtjqVBmq5Atp0wEQe/zbPIsn9cX6Y=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-fukzEksJPz6mCs4yT6GO-A-1; Mon, 16 Sep 2024 12:49:55 -0400
X-MC-Unique: fukzEksJPz6mCs4yT6GO-A-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a9bffc241eso836459185a.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 09:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726505394; x=1727110194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :mime-version:references:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1GXZKybnTnuNS+nIRSUr5QII9/sx+kMsW3/KaJpCCQ8=;
        b=iRhQk+OjvRNO74N4Pg1+PP/5ga/jBT93PvThJ30obNlyJ8TiCARgW6aY0e01nptlCH
         ntDrPB1bY6Oa534mRKzJGhFfmRk9rPZRkXWWkElows4J0m7ze+g+Ph5ZTIOIJYPCQy6k
         RF43hExl4iGqwVHIW8WzGfbS3NMrJTebGZmQaqKQKldaiTJ8iMu8DtHkzf2whl44+i1D
         Due2DM49HSsoLO6MepDrIV9d3G+UcoIzJQKWw6ctv77SoR8lcCpK2vkle1C4fZuArbVb
         UDbuAKLxNjqoj6xVP4Wa5QNSkc/bGs/BeGozOngl7kSiWVng8ZZOCg3Z5LGgp78E4BqT
         Pw1w==
X-Gm-Message-State: AOJu0YwPDv9VMsrdi09CktBGAger7gPzyfkNxiUXPrRAaCHAniZAlVRJ
	QTDWKUE2BDo+gMteJT+CgzLHloM8HphWFGY7GmU/v4Luo0VRDHErRlR0puD/BBQdBDFv7fTDLy2
	B5UoxWBJpo/UqnAyG8ty3VssLSCnw9Ch6U6m2jqAyH9LlNbnQLumZm52wUS0uiqdDVhBC/fyT5R
	Qj5Q5SIicGaWnJ8c5atfilfHrYbjf8kKdsR3Y7Diqc
X-Received: by 2002:a05:620a:4708:b0:7a9:aba6:d033 with SMTP id af79cd13be357-7ab30dcefb0mr1578196685a.56.1726505394319;
        Mon, 16 Sep 2024 09:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEpr++i4tcvPceMgrGqzAnmVR09V07s8NPt541CScK42NXb+0pSNQBgOVdc22NfVWwm8atRhs0RB5k3cMyc+c=
X-Received: by 2002:a05:620a:4708:b0:7a9:aba6:d033 with SMTP id
 af79cd13be357-7ab30dcefb0mr1578193985a.56.1726505393925; Mon, 16 Sep 2024
 09:49:53 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Sep 2024 01:49:52 +0900
From: Andrea Bolognani <abologna@redhat.com>
References: <20240627142338.5114-2-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240627142338.5114-2-CoelacanthusHex@gmail.com>
Date: Tue, 17 Sep 2024 01:49:52 +0900
Message-ID: <CABJz62PRAv0QqszOTHDUdrrgY-Za9y9Vq6mYke=FqP=N5qXvbw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: entry: always initialize regs->a0 to -ENOSYS
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, "Dmitry V . Levin" <ldv@strace.io>, Guo Ren <guoren@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Felix Yan <felixonmars@archlinux.org>, 
	Ruizhe Pan <c141028@gmail.com>, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_095133_559776_32DA17C4 
X-CRM114-Status: GOOD (  20.76  )
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

T24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMTA6MjM6MzlQTSBHTVQsIENlbGVzdGUgTGl1IHdyb3Rl
Ogo+IE90aGVyd2lzZSB3aGVuIHRoZSB0cmFjZXIgY2hhbmdlcyBzeXNjYWxsIG51bWJlciB0byAt
MSwgdGhlIGtlcm5lbCBmYWlscwo+IHRvIGluaXRpYWxpemUgYTAgd2l0aCAtRU5PU1lTIGFuZCBz
dWJzZXF1ZW50bHkgZmFpbHMgdG8gcmV0dXJuIHRoZSBlcnJvcgo+IGNvZGUgb2YgdGhlIGZhaWxl
ZCBzeXNjYWxsIHRvIHVzZXJzcGFjZS4gRm9yIGV4YW1wbGUsIGl0IHdpbGwgYnJlYWsKPiBzdHJh
Y2Ugc3lzY2FsbCB0YW1wZXJpbmcuCj4KPiBGaXhlczogNTI0NDljMTdiZGQxICgicmlzY3Y6IGVu
dHJ5OiBzZXQgYTAgPSAtRU5PU1lTIG9ubHkgd2hlbiBzeXNjYWxsICE9IC0xIikKPiBSZXBvcnRl
ZC1ieTogIkRtaXRyeSBWLiBMZXZpbiIgPGxkdkBzdHJhY2UuaW8+Cj4gUmV2aWV3ZWQtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1IDxDb2VsYWNhbnRodXNIZXhAZ21haWwu
Y29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
PiBpbmRleCAwNWExNmIxZjBhZWUuLjUxZWJmZDIzZTAwNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBA
IC0zMTksNiArMzE5LDcgQEAgdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4KPiAgCQlyZWdzLT5lcGMgKz0gNDsKPiAgCQlyZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7
Cj4gKwkJcmVncy0+YTAgPSAtRU5PU1lTOwo+Cj4gIAkJcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChy
ZWdzKTsKPgo+IEBAIC0zMjgsOCArMzI5LDcgQEAgdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCj4KPiAgCQlpZiAoc3lzY2FsbCA+PSAwICYmIHN5c2NhbGwgPCBOUl9z
eXNjYWxscykKPiAgCQkJc3lzY2FsbF9oYW5kbGVyKHJlZ3MsIHN5c2NhbGwpOwo+IC0JCWVsc2Ug
aWYgKHN5c2NhbGwgIT0gLTEpCj4gLQkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKPiArCj4gIAkJLyoK
PiAgCQkgKiBVbHRpbWF0ZWx5LCB0aGlzIHZhbHVlIHdpbGwgZ2V0IGxpbWl0ZWQgYnkgS1NUQUNL
X09GRlNFVF9NQVgoKSwKPiAgCQkgKiBzbyB0aGUgbWF4aW11bSBzdGFjayBvZmZzZXQgaXMgMWsg
Ynl0ZXMgKDEwIGJpdHMpLgoKSGksCgp0aGlzIGNoYW5nZSBzZWVtcyB0byBoYXZlIGJyb2tlbiBz
dHJhY2UncyB0ZXN0IHN1aXRlLgoKSW4gcGFydGljdWxhciwgdGhlICJsZWdhY3lfc3lzY2FsbF9p
bmZvIiB0ZXN0LCB3aGljaCBpcyBtZWFudCB0bwp2ZXJpZnkgdGhhdCBzdHJhY2UgYmVoYXZlcyBj
b3JyZWN0bHkgd2hlbiBQVFJBQ0VfR0VUX1NZU0NBTExfSU5GTyBpcwpub3QgYXZhaWxhYmxlLCBy
ZXBvcnRzIGEgYm9ndXMgdmFsdWUgZm9yIHRoZSBmaXJzdCBhcmd1bWVudCBvZiB0aGUKc3lzY2Fs
bCAodGhlIG9uZSBwYXNzZWQgdmlhIGEwKS4KClRoZSBib2d1cyB2YWx1ZSBjb21lcyBkaXJlY3Rs
eSBmcm9tIHRoZSBwdHJhY2UoKSBjYWxsLCBiZWZvcmUgc3RyYWNlCmhhcyBhIGNoYW5jZSB0byBt
ZWRkbGUgd2l0aCBpdCwgaGVuY2Ugd2h5IHRoZSBtYWludGFpbmVyIHN1Z2dlc3RlZAp0aGF0IHRo
ZSBpc3N1ZSB3b3VsZCBsaWtlbHkgYmUgdHJhY2VkIGJhY2sgdG8gdGhlIGtlcm5lbC4KCkkgaGF2
ZSBidWlsdCBhIGtlcm5lbCB3aXRoIHRoaXMgY2hhbmdlIHJldmVydGVkIGFuZCwgYXMgZXhwZWN0
ZWQsIHRoZQpzdHJhY2UgdGVzdCBzdWl0ZSBwYXNzZXMuIEFkbWl0dGVkbHkgSSd2ZSB1c2VkIHRo
ZSA2LjExLXJjNyBGZWRvcmEKa2VybmVsIGFzIHRoZSBiYXNlbGluZSBmb3IgdGhpcyB0ZXN0LCBi
dXQgbm9uZSBvZiB0aGUgRmVkb3JhIHBhdGNoZXMKdG91Y2ggdGhlIFJJU0MtViBjb2RlIGF0IGFs
bCBhbmQgdGhlIGZpbGUgaXRzZWxmIGhhc24ndCBiZWVuIHRvdWNoZWQKc2luY2UgcmM3LCBzbyBJ
J20gZmFpcmx5IGNvbmZpZGVudCB0aGUgc2FtZSBiZWhhdmlvciBpcyBwcmVzZW50IGluCnZhbmls
bGEgNi4xMSB0b28uCgpTZWUKCiAgaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvaXNz
dWVzLzMxNQoKZm9yIHRoZSBvcmlnaW5hbCByZXBvcnQuIFBsZWFzZSBsZXQgbWUga25vdyBpZiBJ
IG5lZWQgdG8gcHJvdmlkZQphZGRpdGlvbmFsIGluZm9ybWF0aW9uLCByZXBvcnQgdGhpcyBhbnl3
aGVyZSBlbHNlIChidWd6aWxsYT8pLCBhbmQgc28Kb24uLi4KClRoYW5rcyEKCi0tIApBbmRyZWEg
Qm9sb2duYW5pIC8gUmVkIEhhdCAvIFZpcnR1YWxpemF0aW9uCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
