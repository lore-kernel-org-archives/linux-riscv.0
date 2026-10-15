Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F780CC6B38
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofSvYfWJ102ZHqIwa0VPmTW7o/xtIbhbOZkqgmfOqUg=; b=RBSWVsUGDAMmZm
	aGk/3Tgl+FnHFvzRCUuJ3B/ZQvgge3N3AcuJkdWkKinyRgJ4DoP4EWcp1TnGmLG2LqIgmsrejEg/G
	cJJs28YmlW5gWBfR8L5dIPNJCjHGwUDsDNqi+nAKOoXCFv7mdJ6qsKqy4tNw9oHAHNUkQXvQkr0s4
	LzQBIIKv27Lwc/WCTo9SEK6aCN2haeTa66Tv5HRcxiGPBv7m2dXRM7tvqHDbD8uoRpc/cFpkpdU++
	1fMGN1vI5SXenfhD61S0fR//Dgagz7/wpo9Odh39iVW+QgOtAO0wm8x6/f2b0mNQjE9DMftkiEGvt
	ZBZQ0jhTXf+yXQHAfeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQ8M-0000000199K-0Lbp;
	Thu, 15 Oct 2026 18:24:54 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQ8J-0000000198G-2vaf
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 18:24:52 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-483d290f398so3298108fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792088690; x=1792693490; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4h1CjJh2Pd70gAZyF57+B40XRbkhki100Vx+kKXuXM=;
        b=HSv0GGHO5wfmKMipKUPqNepiuNw7g76w3fyCnuAqI72GB+/qO1MF1XaIwEe5zSUbr5
         GLYn2nELrsZd2mekiY+irCjtZ6+68Bimi7BdlgULH4OTvYUwPI6VFkYZ24LXBXmrcnhH
         nuFoWsJaew5VfC90n1MTq7H6YGgTBCgf1NSnE6offEu5wjmnvkqUbjy6yOhU/R/Z69UE
         B4wyHkPBMCNYKEBNwyPxZNKXw1KtyBl2rPWNdkw9u6t8H2p73GpQOzyA/RCI3EthXX8j
         tDG7V45YHn5lahGE7kbAVVfKfecw8oFjxyFPjYHW+B815HggYBMyj8ViTtw48+JRX+zU
         ++Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088690; x=1792693490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4h1CjJh2Pd70gAZyF57+B40XRbkhki100Vx+kKXuXM=;
        b=uGU+qKMiu7Rc6INrNsg9GIxtUfoNmFGoRwZ184t12UCs3ZLDWplZOp4JYlJJi/Qm+6
         rWTozxsXd2YVbx1PLm3rn00nX6IH0d8T0nRuY0V2qlAZADUSV8jEhihUCI1gTsi2WU7D
         zN5viw0rSevWCkKXRkIX5WaPdqGL9R9tkfdRIaqa1IK41v2sEhei3IMdUK3ajfTeByh8
         0najf+SV5QqEHiFNVcpMxB1goIZD3utYabeSyE6pwB9trTlVDddk7uz9/oBZZa0MxtMF
         vLBIDkzP+7zb+fInpRFueobX/Yx23aD7/gTivjLU+RyisnVo3CCB4zZxxU1TIz0Mpcc4
         OAjg==
X-Forwarded-Encrypted: i=1; AKwUvBxc2Iju8IVcUsNbzyhC30rMvv4Q1nGiM5jd7Q95dzaNMLJ7SaOu+JYbZtTkGsZZ06f7r1y/+HcxgewJ5g==@lists.infradead.org
X-Gm-Message-State: AFq9FYI99oeQVMGC3WQUuLoLEmnmGgm6ocjSAKrDEmS3hmBMiVRn1gN1
	blb/Hp9K8VpnxsEUMNQ31gkDoJ8olF3XVLAWkSLyDoSaiZTslUwpBtdNufzyHzdyNXk=
X-Gm-Gg: AYBFou1rlSagrKLwYfV2IDFvycQgtDFN4xDWA0d3a/nbdIBlqJnjFyjr1ep103exHiP
	lVNqT3LgfBxLpNq9UTrK1FsDtH9jiYpGX+F6Mg3Xq814wySIA8Hb0fSZvni69Ix6bvmLLVBoK62
	yT259SEpmIsf2AZyhzA2Dpibu/zJ+67BP95lXsTULsbPmga2gOFwTCmGj3ooZ0R0y/2pSxKUOfQ
	DAbtcMpeSyeYDVyYA+PSnvu1r9MRr3lA0jrvXEOAsKSwgkZ9LcFpcDL/gi4NN0N1ze0SbtdyKkm
	ioOqr0z6GRYhXy3OpkLuQzKMGQgejWstfGTWW/IKxkzXVC1In8u3JjvTxvqoKypW7ioJgDDM2l3
	vg0NRPVfFlmU8o5usyP48EPfCZSm2Q11l1KrIzGyqH1r09f7Y/lPHZAFKEF6/eiI2+BZWmOPv3l
	MnbDsMaszKJxNDNlsPkfDKRJ/QqUVikLdp5+Tg7PoXj26fmtJIadixKN7AX/1+1Fqgbiygr//F7
	S9NCPmkMEMCdpDlJNX0+w==
X-Received: by 2002:a05:6808:2381:b0:4c3:9892:96fe with SMTP id 5614622812f47-50c40a39b1amr19538248b6e.3.1792088690116;
        Thu, 15 Oct 2026 11:24:50 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.59.77])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-537b7719719sm158052b6e.17.2026.10.15.11.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 11:24:49 -0700 (PDT)
Message-ID: <9254b516-425d-4fa4-b902-1ae38a45571b@sifive.com>
Date: Thu, 15 Oct 2026 13:24:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
To: Davidlohr Bueso <dave@stgolabs.net>, Anup Patel <anup@brainfault.org>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org
References: <20260827211209.2871124-1-dave@stgolabs.net>
 <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
 <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
 <CAAhSdy371da4PnzHLsqS0WFso6PSUvgsVC+fg_wWFymqZPNREQ@mail.gmail.com>
 <20261015180656.dt53d3dtyvlssl5a@offworld>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20261015180656.dt53d3dtyvlssl5a@offworld>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_112451_755090_800A8488 
X-CRM114-Status: GOOD (  19.48  )
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

T24gMjAyNi0xMC0xNSAxOjA2IFBNLCBEYXZpZGxvaHIgQnVlc28gd3JvdGU6Cj4gT24gU2F0LCAx
MCBPY3QgMjAyNiwgQW51cCBQYXRlbCB3cm90ZToKPiAKPj4gSSB0aGluayBoYXZpbmcgc3RhdGlj
LWtleSBrdm1fcmlzY3Zfbm9feGVudmNmZyBpcyBtdWNoIGNsZWFuZXIKPj4gYmVjYXVzZSB3ZSBh
bHJlYWR5IGhhdmUga3ZtX3Jpc2N2X3Zzc3RhZ2VfdGxiX25vX2dwYSB3aGljaAo+PiBpcyBhbm90
aGVyIHdvcmstYXJvdW5kLiBUaGUga3ZtX3Jpc2N2X25vX3hlbnZjZmcgd2lsbCBiZSBkaWFibGVk
Cj4+IGJ5IGRlZmF1bHQgYW5kIHdpbGwgYmUgZW5hYmxlZCBvbmx5IGZvciBQNTAwIChFU1dJTiBF
SUM3NzAwWCkuCj4gCj4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgSSBhZ3JlZSBpdCBsb29r
cyBjbGVhbmVyLgo+IEhvdyBhYm91dCB0aGUgYmVsb3cgKGZpeGVzIHRoaW5ncyBmb3IgbWUpPwo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBpbmRleCBhMzA2MDA1NzkyMzEuLjUxYjZk
MWY3NjYyNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBAQCAtMzMxLDUgKzMz
MSw2IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKPiDCoAo+IMKgLyogRmxhZ3MgcmVwcmVzZW50aW5nIGltcGxlbWVudGF0aW9u
IHNwZWNpZmljIGRldGFpbHMgKi8KPiDCoERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShrdm1fcmlz
Y3ZfdnNzdGFnZV90bGJfbm9fZ3BhKTsKPiArREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGt2bV9y
aXNjdl9ub194ZW52Y2ZnKTsKPiDCoAo+IMKgI2VuZGlmIC8qIF9fUklTQ1ZfS1ZNX0hPU1RfSF9f
ICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYyBiL2FyY2gvcmlzY3Yva3Zt
L21haW4uYwo+IGluZGV4IDg5NTY4Y2NjZTAxZC4uZGVjMzM4MzE5Y2I3IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+IEBA
IC0xNSwxMSArMTUsMTMgQEAKPiDCoCNpbmNsdWRlIDxhc20va3ZtX21tdS5oPgo+IMKgI2luY2x1
ZGUgPGFzbS9rdm1fbmFjbC5oPgo+IMKgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiArI2luY2x1ZGUg
PGFzbS92ZW5kb3JpZF9saXN0Lmg+Cj4gwqAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3ZlY3Rvci5o
Pgo+IMKgCj4gwqBzdGF0aWMgREVGSU5FX1BFUl9DUFUoYm9vbCwga3ZtX3Jpc2N2X3ZpcnR1YWxp
emF0aW9uX2VuYWJsZWQpOwo+IMKgCj4gwqBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShrdm1fcmlz
Y3ZfdnNzdGFnZV90bGJfbm9fZ3BhKTsKPiArREVGSU5FX1NUQVRJQ19LRVlfRkFMU0Uoa3ZtX3Jp
c2N2X25vX3hlbnZjZmcpOwo+IMKgCj4gwqBzdGF0aWMgdm9pZCBrdm1fcmlzY3Zfc2V0dXBfdmVu
ZG9yX2ZlYXR1cmVzKHZvaWQpCj4gwqB7Cj4gQEAgLTI5LDYgKzMxLDEzIEBAIHN0YXRpYyB2b2lk
IGt2bV9yaXNjdl9zZXR1cF92ZW5kb3JfZmVhdHVyZXModm9pZCkKPiDCoMKgwqDCoMKgwqDCoMKg
IHN0YXRpY19icmFuY2hfZW5hYmxlKCZrdm1fcmlzY3ZfdnNzdGFnZV90bGJfbm9fZ3BhKTsKPiDC
oMKgwqDCoMKgwqDCoMKgIGt2bV9pbmZvKCJWUy1zdGFnZSBUTEIgZG9lcyBub3QgY2FjaGUgZ3Vl
c3QgcGh5c2ljYWwgYWRkcmVzcyBhbmQgVk1JRFxuIik7Cj4gwqDCoMKgwqAgfQo+ICsKPiArwqDC
oMKgIC8qIFNpRml2ZSBQNTUwIChFU1dJTiBFSUM3NzAwWCk6IEggb24gYSAxLjExIGJhc2UsIG5v
IGhlbnZjZmcvc2VudmNmZyAqLwo+ICvCoMKgwqAgaWYgKHJpc2N2X2NhY2hlZF9tdmVuZG9yaWQo
MCkgPT0gU0lGSVZFX1ZFTkRPUl9JRCAmJgo+ICvCoMKgwqDCoMKgwqDCoCAocmlzY3ZfY2FjaGVk
X21hcmNoaWQoMCkgJiAweEZGRkYpID09IDB4OCkgewoKVGhpcyBjaGVjayBpcyBub3Qgc3BlY2lm
aWMgZW5vdWdoIHRvIG1hdGNoIG9ubHkgdGhlIGFmZmVjdGVkIGltcGxlbWVudGF0aW9ucy4KWW91
IG5lZWQgdG8gbWF0Y2ggdGhlIHdob2xlIG1hcmNoaWQgdmFsdWUgKDB4ODAwMDAwMDAwMDAwMDAw
OCkuIE90aGVyd2lzZSB0aGlzCmxvb2tzIGdvb2QgdG8gbWUuCgpSZWdhcmRzLApTYW11ZWwKCj4g
K8KgwqDCoMKgwqDCoMKgIHN0YXRpY19icmFuY2hfZW5hYmxlKCZrdm1fcmlzY3Zfbm9feGVudmNm
Zyk7Cj4gK8KgwqDCoMKgwqDCoMKgIGt2bV9pbmZvKCJoZW52Y2ZnIGFuZCBzZW52Y2ZnIENTUnMg
bm90IGltcGxlbWVudGVkXG4iKTsKPiArwqDCoMKgIH0KPiDCoH0KPiDCoAo+IMKgbG9uZyBrdm1f
YXJjaF9kZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDdmMTYzNmM0NGQ0
MS4uZTVmODc3Mjg0MDI2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC03NzIsNyArNzcyLDggQEAgc3RhdGljIF9f
YWx3YXlzX2lubGluZSB2b2lkCj4ga3ZtX3Jpc2N2X3ZjcHVfc3dhcF9pbl9ndWVzdF9zdGF0ZShz
dHJ1Y3Qga3ZtX3ZjcHUgKgo+IMKgwqDCoMKgIHN0cnVjdCBrdm1fdmNwdV9jc3IgKmNzciA9ICZ2
Y3B1LT5hcmNoLmd1ZXN0X2NzcjsKPiDCoAo+IMKgwqDCoMKgIHZjcHUtPmFyY2guaG9zdF9zY291
bnRlcmVuID0gY3NyX3N3YXAoQ1NSX1NDT1VOVEVSRU4sIGNzci0+c2NvdW50ZXJlbik7Cj4gLcKg
wqDCoCB2Y3B1LT5hcmNoLmhvc3Rfc2VudmNmZyA9IGNzcl9zd2FwKENTUl9TRU5WQ0ZHLCBjc3It
PnNlbnZjZmcpOwo+ICvCoMKgwqAgaWYgKCFzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZrdm1fcmlz
Y3Zfbm9feGVudmNmZykpCj4gK8KgwqDCoMKgwqDCoMKgIHZjcHUtPmFyY2guaG9zdF9zZW52Y2Zn
ID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcsIGNzci0+c2VudmNmZyk7Cj4gwqDCoMKgwqAgaWYgKHJp
c2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKQo+IMKg
wqDCoMKgwqDCoMKgwqAgdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVuMCA9IGNzcl9zd2FwKENTUl9T
U1RBVEVFTjAsIHNtY3NyLT5zc3RhdGVlbjApOwo+IMKgwqDCoMKgIGlmIChyaXNjdl9oYXNfZXh0
ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfWklDRklTUykpCj4gQEAgLTc4Niw3ICs3ODcs
OCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQKPiBrdm1fcmlzY3ZfdmNwdV9zd2FwX2lu
X2hvc3Rfc3RhdGUoc3RydWN0IGt2bV92Y3B1ICp2Cj4gwqDCoMKgwqAgc3RydWN0IGt2bV92Y3B1
X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+IMKgCj4gwqDCoMKgwqAgY3NyLT5z
Y291bnRlcmVuID0gY3NyX3N3YXAoQ1NSX1NDT1VOVEVSRU4sIHZjcHUtPmFyY2guaG9zdF9zY291
bnRlcmVuKTsKPiAtwqDCoMKgIGNzci0+c2VudmNmZyA9IGNzcl9zd2FwKENTUl9TRU5WQ0ZHLCB2
Y3B1LT5hcmNoLmhvc3Rfc2VudmNmZyk7Cj4gK8KgwqDCoCBpZiAoIXN0YXRpY19icmFuY2hfdW5s
aWtlbHkoJmt2bV9yaXNjdl9ub194ZW52Y2ZnKSkKPiArwqDCoMKgwqDCoMKgwqAgY3NyLT5zZW52
Y2ZnID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcsIHZjcHUtPmFyY2guaG9zdF9zZW52Y2ZnKTsKPiDC
oMKgwqDCoCBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NN
U1RBVEVFTikpCj4gwqDCoMKgwqDCoMKgwqDCoCBzbWNzci0+c3N0YXRlZW4wID0gY3NyX3N3YXAo
Q1NSX1NTVEFURUVOMCwgdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVuMCk7Cj4gwqDCoMKgwqAgaWYg
KHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9aSUNGSVNTKSkKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9jb25maWcuYyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfY29uZmlnLmMKPiBpbmRleCBiNjhhYTgzMGFhZjUuLjliOGU0ZjFmMTJmNCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2NvbmZpZy5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9jb25maWcuYwo+IEBAIC04Miw5ICs4MiwxMSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1
X2NvbmZpZ19sb2FkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiDCoMKgwqDCoMKgwqDCoMKgIG5z
aCA9IG5hY2xfc2htZW0oKTsKPiDCoMKgwqDCoMKgwqDCoMKgIG5hY2xfY3NyX3dyaXRlKG5zaCwg
Q1NSX0hFREVMRUcsIGNmZy0+aGVkZWxlZyk7Cj4gwqDCoMKgwqDCoMKgwqDCoCBuYWNsX2Nzcl93
cml0ZShuc2gsIENTUl9ISURFTEVHLCBjZmctPmhpZGVsZWcpOwo+IC3CoMKgwqDCoMKgwqDCoCBu
YWNsX2Nzcl93cml0ZShuc2gsIENTUl9IRU5WQ0ZHLCBjZmctPmhlbnZjZmcpOwo+IC3CoMKgwqDC
oMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG5hY2xfY3NyX3dyaXRlKG5zaCwgQ1NSX0hFTlZDRkdILCBjZmctPmhlbnZjZmcgPj4g
MzIpOwo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXN0YXRpY19icmFuY2hfdW5saWtlbHkoJmt2bV9y
aXNjdl9ub194ZW52Y2ZnKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5hY2xfY3NyX3dy
aXRlKG5zaCwgQ1NSX0hFTlZDRkcsIGNmZy0+aGVudmNmZyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG5hY2xfY3NyX3dyaXRlKG5zaCwgQ1NSX0hFTlZDRkdILCBjZmctPmhlbnZj
ZmcgPj4gMzIpOwo+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAocmlz
Y3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTikpIHsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFjbF9jc3Jfd3JpdGUobnNoLCBDU1JfSFNUQVRFRU4w
LCBjZmctPmhzdGF0ZWVuMCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FTkFC
TEVEKENPTkZJR18zMkJJVCkpCj4gQEAgLTkzLDkgKzk1LDExIEBAIHZvaWQga3ZtX3Jpc2N2X3Zj
cHVfY29uZmlnX2xvYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+IMKgwqDCoMKgIH0gZWxzZSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoCBjc3Jfd3JpdGUoQ1NSX0hFREVMRUcsIGNmZy0+aGVkZWxlZyk7
Cj4gwqDCoMKgwqDCoMKgwqDCoCBjc3Jfd3JpdGUoQ1NSX0hJREVMRUcsIGNmZy0+aGlkZWxlZyk7
Cj4gLcKgwqDCoMKgwqDCoMKgIGNzcl93cml0ZShDU1JfSEVOVkNGRywgY2ZnLT5oZW52Y2ZnKTsK
PiAtwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjc3Jfd3JpdGUoQ1NSX0hFTlZDRkdILCBjZmctPmhlbnZjZmcgPj4g
MzIpOwo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXN0YXRpY19icmFuY2hfdW5saWtlbHkoJmt2bV9y
aXNjdl9ub194ZW52Y2ZnKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNzcl93cml0ZShD
U1JfSEVOVkNGRywgY2ZnLT5oZW52Y2ZnKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
SVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY3NyX3dyaXRlKENTUl9IRU5WQ0ZHSCwgY2ZnLT5oZW52Y2ZnID4+IDMyKTsKPiArwqDCoMKg
wqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5s
aWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNzcl93cml0ZShDU1JfSFNUQVRFRU4wLCBjZmctPmhzdGF0ZWVuMCk7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
