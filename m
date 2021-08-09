Return-Path: <SRS0=KDuJ=NA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4726BC4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 16:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14AF60F56
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 16:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F14AF60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bQIvI7Xuf47wn8n/UlNBHBE69OJQOGNI27S/TlhghB4=; b=zh7Gh2zPyBIb4GpIorFU8WvdRS
	zjHP/V5zswwq3THbvMdhQSxkNbXcQ2CuJ7GmsN5pkXRe2QvMAVgxocWhdH7kxCxgsi9otnX7MXjgM
	Jsgevvi5LnC527QVoBEGVJ63ZtcdJrx8grWIlTleGvcVQdCiXswMbcbhXIneYkqNMrVRV1HUHkl8s
	S2jNOb+BWFRiImiiaqi/Ka8WQEiNruuOktKgxwtyeOAbDuku7s9AuJU3oCMJa7Fsidth1D8xHJTvV
	oGM+SrH+Jx9hTGSrvRdxubAEFxAis32QIkg+m8RNp4PpkAFyFgmK7jc4MtO87ab/j174qMgt4Z19N
	CXz0ehOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD808-001R4N-9w; Mon, 09 Aug 2021 16:19:44 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD804-001R3g-SZ
 for linux-riscv@lists.infradead.org; Mon, 09 Aug 2021 16:19:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id t3so16921154plg.9
 for <linux-riscv@lists.infradead.org>; Mon, 09 Aug 2021 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4LSJDYEY+6kuiwhcL/I8SB3Fm3WdyLJ6KAWharjU0l8=;
 b=ehrS3+t693zL+PdNPG3ScRYROUBYlpmFPDzdymfEbEAVDaHnvmPi8Velu9dPRC37E+
 YqYlh2nUV2fYVNGvEKHxL3PvIQ/eJPKLaxS0RxyIkPN1wNv+ZLnQznrv4uuFIMFCtcIW
 r5s7bdhywNgmVlXXXQSL3J2uMcK1tIJfQoCoh3YhmWQAEZ1+vujQOD1cHuZSPezbKhCi
 QgER/W4OoBhQ2hsKKzqNpCwTx/6Wb3xcpaGREgdq8ERMSqveQitRrhwfbC9E4vwLGYd4
 YoBG5wUUT8u/SLehe0QMDBi/JuGtqSoiZktu8SYYNP+IK5SFA3phKWINkhHZLKP43vpG
 yrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4LSJDYEY+6kuiwhcL/I8SB3Fm3WdyLJ6KAWharjU0l8=;
 b=LhMQIUAQwzto0u2ShsJgvxrZTfmVDzBaFSnzx+3MF974jggEfH7GRGqM1UCINdUnbw
 knYPWuyVxfsqUD6rjGzNUSzVezmOsgmOVZyLwefPLrrGdaR7FVntuOYHy9Jf/eRka/ki
 zKRQ0iRbEH0IXfyVUnNDlc7AzfmBDPOwARJGj/yVaku/hbRHEs0ghjrQ4cK2O2cKXsJK
 KGDYOXqStZx9W5ZJNiRQ8CFQjMKU8FZLJkDIvvFdzdDGiL4OVTVgcRxd6MZvlZLI0KIb
 XygIjlgVg4iaTJrhpeUaB9UllvSpwdMUT/zabtdPaRmpaPYn5J2KSPZ6HPufqCMt9Uls
 i1eg==
X-Gm-Message-State: AOAM530uY+TEIKnoVGzaHBxdLuh3aLoTtYET9oO+1DXtLmbUWaWvHxBp
 LkXpVA1AHWkiryZpM1mlTlUtvQ==
X-Google-Smtp-Source: ABdhPJzgjD+C21YT6Y2WNT2Cn01Hn42Wx6m+e8FUa3X4B9OlfqD82m0E5Vude4bRQLH6fkJth5DX8g==
X-Received: by 2002:a17:90b:3718:: with SMTP id
 mg24mr2695744pjb.158.1628525978344; 
 Mon, 09 Aug 2021 09:19:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bk24sm22061446pjb.26.2021.08.09.09.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 09:19:37 -0700 (PDT)
Date: Mon, 09 Aug 2021 09:19:37 -0700 (PDT)
X-Google-Original-Date: Mon, 09 Aug 2021 09:19:35 PDT (-0700)
Subject: Re: Linux 5.14-rc2
In-Reply-To: <bba05067-6f2f-6166-02a0-839f514d3780@gmail.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akira.tsukamoto@gmail.com
Message-ID: <mhng-cf5d58bf-52d0-4342-92f4-f94e40450840@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_091941_007342_4BC0EBF0 
X-CRM114-Status: GOOD (  18.38  )
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

T24gU3VuLCAyNSBKdWwgMjAyMSAwMjo1Njo1MSBQRFQgKC0wNzAwKSwgYWtpcmEudHN1a2Ftb3Rv
QGdtYWlsLmNvbSB3cm90ZToKPiBPbiA3LzI0LzIxIDA5OjU4LCBQYWxtZXIgRGFiYmVsdCB3cm90
ZToKPj4+IEkgaGF2ZSBzZW50IHRoZSBmaXhlcyB5ZXN0ZXJkYXkgaW4gbXkgdGltZS4KPj4+Cj4+
PiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2LzIwMjEt
SnVseS8wMDc2MjEuaHRtbAo+Pj4KPj4+IEd1ZW50ZXIgYW5kIEdlZXJ0IGhhdmUgY29uZmlybWVk
IHRoZSBmaXguCj4+Pgo+Pj4gaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9s
aW51eC1yaXNjdi8yMDIxLUp1bHkvMDA3NjM0Lmh0bWwKPj4+IGh0dHBzOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9waXBlcm1haWwvbGludXgtcmlzY3YvMjAyMS1KdWx5LzAwNzYyNi5odG1sCj4+Pgo+
Pj4gQWtpcmEKPj4KPj4gVGhhbmtzLsKgIEkndmUgZ290IHRoZXNlIG9uIGZpeGVzIG5vdywgSSds
bCBzZW5kIHRoZW0gdXAgdG9tb3Jyb3cgbW9ybmluZyBhc3N1bWluZyB0aGUgYXV0b2J1aWxkZXJz
IGRvbid0IGZpbmQgYW55IGlzc3Vlcy7CoCBMaWtlIEkgc2FpZCBpbiB0aGUgb3RoZXIgdGhyZWFk
IEkgd2Fzbid0IGdldHRpbmcgdGhlc2UgYWxsbW9kY29uZmlnIGZhaWx1cmVzLCBzbyBpZiB0aGVy
ZSdzIGFuIGVhc3kgd2F5IHRvIHJlcHJvZHVjZSB0aGVtIEknZCBiZSBoYXBweSB0byBhZGQgaXQg
dG8gbXkgc2V0dXAgLS0gSSBkb24ndCByZWFsbHkga25vdyBhbnl0aGluZyBhYm91dCBHQ0MgcGx1
Z2lucywgSSdtIGp1c3QgdXNpbmcgRGViaWFuJ3MgdG9vbGNoYWluIGZvciBteSBMaW51eCB0ZXN0
IHNldHVwIChoYXZlbid0IGdvdHRlbiBhcm91bmQgdG8gbWVyZ2luZyBpdCB3aXRoIG15IEdDQyB0
ZXN0IHNldHVwLCBhbmQgaXQncyBiZWVuIGEgZGVjYWRlIHNvIEkgZ3Vlc3MgSSBzaG91bGQgc3Rv
cCBwcmV0ZW5kaW5nIHRoYXQncyBnb2luZyB0byBoYXBwZW4gOykpLgo+Cj4gU3VyZSwgbXkgcHJv
Y2VkdXJlIGlzIGJhc2VkIG9uIEd1ZW50ZXLigJlzIGluc3RydWN0aW9ucy4KPiBJIGJ1aWx0IHFl
bXUgdjYuMC4wLCBidWlsZHJvb3QgMjAyMS4wNSBhbmQgdGhlIGtlcm5lbCB3aXRoIHRoZSB0b29j
aGFpbiBjYW1lIHdpdGggYnVpbGRyb290Lgo+Cj4gIyBxZW11Cj4gZ2l0IGNsb25lIGh0dHBzOi8v
Z2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS5naXQKPiBjZCBxZW11Cj4gZ2l0IGNoZWNrb3V0
IC1iIHY2LjAuMAo+IGdpdCBzdWJtb2R1bGUgdXBkYXRlIC0taW5pdCAtLXJlY3Vyc2l2ZQo+IGdp
dCBzdWJtb2R1bGUgc3luYyAtLXJlY3Vyc2l2ZQo+IC4vY29uZmlndXJlIC0tdGFyZ2V0LWxpc3Q9
cmlzY3YzMi1zb2Z0bW11ICAtLWRpc2FibGUtdXNlciAtLWRpc2FibGUtZ251dGxzIC0tZGlzYWJs
ZS1kb2NzIC0tZGlzYWJsZS1uZXR0bGUgLS1kaXNhYmxlLWdjcnlwdCAtLWRpc2FibGUtdm5jLXBu
ZyAtLWRpc2FibGUteGVuIC0tZGlzYWJsZS14ZW4tcGNpLXBhc3N0aHJvdWdoIC0tZGlzYWJsZS1s
aWJzc2gKPiBtYWtlIC1qICQobnByb2MpCj4KPiAjIGJ1aWxkcm9vdAo+IGdpdCBjbG9uZSBnaXQ6
Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QKPiBjZCBidWlsZHJvb3QvCj4gZ2l0IGNoZWNr
b3V0IDIwMjEuMDUgLWIgMjAyMS4wNQo+IG1ha2UgcWVtdV9yaXNjdjMyX3ZpcnRfZGVmY29uZmln
Cj4gbWFrZQo+Cj4gIyBrZXJuZWwKPiBleHBvcnQgUEFUSD1sb2NhaW9uX29mX2J1aWxkcm9vdC9v
dXRwdXQvaG9zdC9iaW46JHtQQVRIfSIKPiBCdWlsdCBrZXJuZWwuCj4KPiAjIHByZXBhcmUgYm9v
dGluZyBydjMyCj4gRG93bmxvYWRlZCByb290ZnMuY3BpbyBhbmQgcnVuLnNoIGZyb20gR3VlbnRl
cuKAmXMgbGluayB0byBpbnNpZGUgYnVpbGRyb290L291dHB1dC9pbWFnZXMvLgo+IGh0dHA6Ly9z
ZXJ2ZXIucm9lY2stdXMubmV0L3FlbXUvcmlzY3YzMi8KPgo+IGNkIG91dHB1dC9pbWFnZXMKPiBV
c2VkIHJldmlzZWQgcnVuLnNoLgo+IGBgYAo+IGV4cG9ydCBQQVRIPSJsb2NhdGlvbl9vZl9xZW11
L2J1aWxkOiR7UEFUSH0iCj4gZXhwb3J0IEtFUk5FTF9ESVI9bG9jYXRpb25fb2Zfa2VybmVsL2Fy
Y2gvcmlzY3YvYm9vdC8KPiBxZW11LXN5c3RlbS1yaXNjdjMyIC1NIHZpcnQgLW0gNTEyTSAtbm8t
cmVib290IFwKPiAgICAgLWJpb3MgZGVmYXVsdCAta2VybmVsICR7S0VSTkVMX0RJUn1JbWFnZSBc
Cj4gICAgIC1pbml0cmQgcm9vdGZzLmNwaW8gXAo+ICAgICAtYXBwZW5kICJyZGluaXQ9L3NiaW4v
aW5pdCBjb25zb2xlPXR0eVMwLDExNTIwMCBlYXJseWNvbj11YXJ0ODI1MCxtbWlvLDB4MTAwMDAw
MDAsMTE1MjAwIiBcCj4gICAgIC1ub2dyYXBoaWMgLW1vbml0b3Igbm9uZQo+IGBgYAo+Cj4gVGhl
IHJvb3Rmcy5jcGlvIGNoZWNrcyB0aGUgbmV0d29yayBhZnRlciBib290aW5nIGFuZCBwb3dlcm9m
ZiBpbW1lZGlhdGVseSB0byByZXR1cm4gdG8gc2hlbGwuCgpUaGFua3MuICBJIHdhcyBhY3RhdWxs
eSBhc2tpbmcgZm9yIHRoZSByYW5kc3RydWN0IGJ1aWxkIGluc3RydWN0aW9ucywgCmJ1dCBHZWVy
dCBhbHJlYWR5IHByb3ZpZGVkIHRob3NlIGluIHRoZSBvdGhlciB0aHJlYWQuICBHaXZlbiBob3cg
ZWFzeSAKdGhlIDMyLWJpdCBib290IGlzIG5vdywgdGhvdWdoLCBJIGZpZ3VyZWQgSSdkIGp1c3Qg
Z2V0IGl0IHVwIGFuZCAKcnVubmluZy4gIEl0J3MgaW4gbm93LgoKVGhhbmtzIQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
