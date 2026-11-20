Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D98606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8MiJ4bj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=gQzyz9nr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d1s0C1vRJ/wRy3p1twpkc2pErTpnAM1JRVyCa1MeN3I=; b=N8MiJ4bjyhPUVXS3NN5gJdjGkN
	/hgW8OjIriSPAITgPP57/6+g7LMmIBSCgSFH150cYgBzDLihDELQyTvpoiwQc4D4Fzk1MoSanlUWw
	dUK2lvkw4s7kNY4yvhzFHxMcNGDUkdeYpXRvfcQSPNBtcFIwz+JC98/8XTCpsGNh4nhL5D0HqYptK
	rQowO4uXIjBB94tkuwHLxQKHOFeaTCHVhPSP2gfV+TbqNoZDZza1IzKe4Jyd8zsFyFEsPSuu7soFC
	A15vZoJxfcquUjH83kPij+C5r6H+phhl9KPGJIfzFH/B162gjgrh+ixbHYBc8DcYZhNdQMawR2AQX
	SSmiAaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMN7-0000000Eggh-09JU;
	Fri, 20 Nov 2026 11:01:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMN5-0000000Egg8-06es
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 11:01:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso387522e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 03:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172493; cv=none;
        d=google.com; s=arc-20260327;
        b=Mrxxs4Hs7bSgdLzzLKwHVPGHj1/j9Z/XI3Kc4sqPGuO0eiX1myoIE/4HeCaFUNFR6Z
         N7G/mxQ7ePAY5c913YURkwV26sWVmOCOUGA+OxykUI8BlEA0mmIsPbTC9IRDvVcdEqsJ
         eCixbpawWHxzKZNv0MK/moLs62/kQ5RQ6bhrs/tV9aElzsbnKMOo3HU5n3G82x/e3mqL
         vrMNdasZn8nwbuRpHJ+dZK+beIQWoqrvV7G55Qj2Hxfbjm5VgSpTGD6MQPMXtJCb6QHb
         gI4i++60Ort5AT3MQ8u+fqSg2eXRcJvISsHgQta1wbja6y8UIDKS0SGyT5V2O6JpbB5G
         3YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qRhTbOFQ8qqwBALU8BhSOIO7l1WfGteCJAegsd7jcOM=;
        fh=m+HZksA4DUv6SHIZqbw57tgEJs+1IYk81h9n+h0GZN0=;
        b=M0E8wEGokOGkSQod6Rlc0iEImllEaAKe34vxYLePYKCHAfIOVpwKzhJbTeuGGOVJvK
         0sLVWgskJ7Cbbv6EDk76JqtFXiAqjimNaWxJBaS4jp71/Ojtx27zKsaN1UOJrgHKKMAt
         J/kYYE2jB78WfIIQOeMjzM3mR/SIrxSzr9oLJY6ZQeaCqEz3mNPAljGxHhkWkdPkyztJ
         ciZYY33dwrJHI1fstibXz2j668Gdfgpk1ltVViQ5X/z2Rvqw5p3/fuQw2R+saTjmJ/uH
         NaVcFTaD/3ZQejgHptBjHYGreDJ6v4+PoN4WF5I5YoQHjg8DhYXJ42zHTlP4cKOEsRg5
         BNYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795172493; x=1795777293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRhTbOFQ8qqwBALU8BhSOIO7l1WfGteCJAegsd7jcOM=;
        b=gQzyz9nrV1G63mKPTOwTi4taWkkqVKY8Pr3EGl2jNQzIZH6b9iU4kPZHIoXhM5OFzi
         2CUCoTs2P9yaxtnNoIgzIRHs2wc4ORocOQvvHnxMYGiva2fk1Uxv6SdBHQ0NOipP90l6
         RdttXgfP8OinzJ8qpa/y5xdpVHwRBHsM84890AfNAFnV7GPBrDm8tNok03xsL7pLsJI2
         KVnQTcM3XOMmatNM+ldMaG77gAoRx8xHZssM9KulQRoK6f55bYGUJvaM38yVDudYuKwX
         /m6Z2UDj2Lls99ijbdwjV+6b0wIY50P9zFf440guez++8EYIFvWkOEFXsDFeq8i2HeU6
         Tbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172493; x=1795777293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRhTbOFQ8qqwBALU8BhSOIO7l1WfGteCJAegsd7jcOM=;
        b=b91NWn9tpmX88GYH5Y8375UFLo0rpkEPUxC+Acnk30Mj6JKSAkP2oLR5w+6NGbTRg3
         d8A11JPE5I0OIBQoIRQvfSPwwMi+IfkYidxgZ4EhbjbdreJTDEcGdYo0D4gl6XcqdiW6
         zza3oJFtrtABZ9fg4iGYgNoE34CMlLzAOOVI5UPbWpEY9qPIRFYtxnpXwUdSHUsIvQIm
         KWq9Wi/QRg3BOKG7FHvdR96PtatwYfQaj03DTB8VfIuvvnVhbnA+on8FcZl7Ql9gExWh
         Y+Sme0WPgZ4K4t+teJ3g7glOkZh5ORYaoj71lkHIGrBHafRA+4r1rq9pCqvMpwApVF6F
         siGg==
X-Forwarded-Encrypted: i=1; AL+hErFfuSXamjkzYSKDebITs61zhzkts/69TX5UNF3zJXGInV/qOnfOn3KR7UhU6Xfle2W3AvRZE4aRV5qscw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9zX8qDbLiT7lUc73WR8HJKThgKGhVUEhys0XNT6Dj64UagEMMG
	xclSj9otW2oWsIwysDohCGgGI0PgStFNDAyU5upbA4DRJF1WpjAvL/GxWMrLhsFgCzb8+CaDVxf
	JKUr0ceqH85bgxt51PdF5C5odt1VlyADNSxLdGAjZEw==
X-Gm-Gg: AZFdTZfzSFwDxrdNhy+Ur5rSAAWvSPaM17Pkt175Nmhf1H2OgK2Oj2dMbs53+nGo9uQ
	a/F8ZJBXTb2t7OQDcJPwfu7p1i6WV/RA4eeOpV3RMk4swXUQy7QJdixKQWDux72X7WitGUUgRFG
	UcwUh0qK+UmvfmUFcuLROE8MpPTprAs7llemqUrV6on+KGPX84EkWqinsghy5+M/3PkGG8KmMQJ
	QoNeoEHsKKD8DG5NvM3W/aMTR47pGreId2LeDQixcj/Zd7vTMettDSpc+nxQL4N3Lg7j25Cy82A
	UdQWF1M+/83RdYqBzwz3+npTkOnqwPeP+eBKQYNdXFEmBxU4Dh6+vnJD91Dc/vud75hIwxuXqrQ
	vHPWXTYWmCZyA4WqQWgRSIAeYrajC16el/ZiKQ+v+RzSUt2sDBtH3NyCfwfpNhPFB58XWMiX7rr
	Z79UYG5NopbEehMAGmpt8N6p2WLAOJ5I1Fve5U1669bsvVJzTfUTza
X-Received: by 2002:a05:6512:1048:b0:5b8:bc5e:d10e with SMTP id
 2adb3069b0e04-5c1bc81c3c4mr802688e87.56.1795172492078; Fri, 20 Nov 2026
 03:01:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118092147.2017658-1-prajwal.n@oss.qualcomm.com>
 <20261118092147.2017658-3-prajwal.n@oss.qualcomm.com> <CAAhSdy2ZKBc8A522viUWZbn418MC-C2cy7pQYLBFYn4gsTvJ8Q@mail.gmail.com>
 <10c7622c-4dc4-4ffd-89b1-0678e3553f53@roeck-us.net>
In-Reply-To: <10c7622c-4dc4-4ffd-89b1-0678e3553f53@roeck-us.net>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Nov 2026 16:31:20 +0530
X-Gm-Features: Aa3M54os6gtfofDw9EYiE_SoRvn75n9bUS0KZHJkEbw23kks-0yxXNMYX9KJ-rw
Message-ID: <CAAhSdy0vhaWV0kFRJhPJJoLezadJHNGfKsM-k2w_4io_vpANaw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] drivers/watchdog: Add RISC-V SBI watchdog driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Prajwal N <prajwal.n@oss.qualcomm.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, wim@linux-watchdog.org, 
	radim.krcmar@oss.qualcomm.com, anup.patel@oss.qualcomm.com, 
	linux-riscv@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	prajwal.n.oss@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030135_132161_CCC4FA6F 
X-CRM114-Status: GOOD (  22.68  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgODo1N+KAr1BNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4gd3JvdGU6Cj4KPiBPbiAxMS8xOS8yNiAwNzowNCwgQW51cCBQYXRlbCB3cm90
ZToKPiA+IE9uIFdlZCwgTm92IDE4LCAyMDI2IGF0IDI6NTLigK9QTSBQcmFqd2FsIE4gPHByYWp3
YWwubkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+Pgo+ID4+IEFkZCB0aGUgUklTQ1ZfU0JJ
X1dBVENIRE9HIEtjb25maWcgb3B0aW9uLCB3aGljaCBkZXBlbmRzIG9uCj4gPj4gUklTQ1YgYW5k
IFJJU0NWX1NCSSBzdXBwb3J0Lgo+ID4KPiA+IEtjb25maWcgb3B0aW9uIGlzIGFsd2F5cyBuZWVk
ZWQgd2hlbiBhZGRpbmcgbmV3IGRyaXZlciBzbwo+ID4gdGhlcmUgaXMgbm90IG11Y2ggdmFsdWUg
aW4gaGF2aW5nIHRoaXMgc3RhdGVtZW50IGluIGNvbW1pdAo+ID4gZGVzY3JpcHRpb24uCj4gPgo+
ID4+Cj4gPj4gQWRkIGEgd2F0Y2hkb2cgZHJpdmVyIGZvciB0aGUgUklTQy1WIFNCSSB3YXRjaGRv
ZyBleHRlbnNpb24uCj4gPj4gVGhlIGRyaXZlciBpbnRlZ3JhdGVzIHdpdGggdGhlIExpbnV4IHdh
dGNoZG9nIGZyYW1ld29yayB0bwo+ID4+IGNvbmZpZ3VyZSBhbmQgY29udHJvbCB0aGUgd2F0Y2hk
b2cuIFRoZSBkcml2ZXIgaW52b2tlcyB0aGUKPiA+PiBTQkkgd2F0Y2hkb2cgdXNpbmcgdGhlIHN0
YW5kYXJkIFNCSSBjYWxscy4KPiA+Pgo+ID4+IFN1cHBvcnQgcHJldGltZW91dCBldmVudCBub3Rp
ZmljYXRpb25zIHVzaW5nIE1lc3NhZ2UgU2lnbmFsZWQKPiA+PiBJbnRlcnJ1cHRzIChNU0lzKS4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFByYWp3YWwgTiA8cHJhandhbC5uQG9zcy5xdWFsY29t
bS5jb20+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgICAgICAgICB8
ICAxMCArCj4gPj4gICBkcml2ZXJzL3dhdGNoZG9nL01ha2VmaWxlICAgICAgICB8ICAgMSArCj4g
Pj4gICBkcml2ZXJzL3dhdGNoZG9nL3Jpc2N2X3NiaV93ZHQuYyB8IDQzNiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPj4gICAzIGZpbGVzIGNoYW5nZWQsIDQ0NyBpbnNlcnRpb25z
KCspCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy93YXRjaGRvZy9yaXNjdl9zYmlf
d2R0LmMKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgYi9k
cml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiA+PiBpbmRleCBmN2QwYTBjMmMwZWYuLmQ2YjRlOGNj
ZDA1NyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiA+PiArKysg
Yi9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiA+PiBAQCAtMjE2NCw2ICsyMTY0LDE2IEBAIGNv
bmZpZyBTVEFSRklWRV9XQVRDSERPRwo+ID4+ICAgICAgICAgICAgU2F5IFkgaGVyZSB0byBzdXBw
b3J0IHRoZSB3YXRjaGRvZyBvZiBTdGFyRml2ZSBKSDcxMDAgYW5kIEpINzExMAo+ID4+ICAgICAg
ICAgICAgU29DLiBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVsZSBpZiBj
aG9vc2UgTS4KPiA+Pgo+ID4+ICtjb25maWcgUklTQ1ZfU0JJX1dBVENIRE9HCj4gPj4gKyAgICAg
ICB0cmlzdGF0ZSAiUklTQy1WIFNCSSBiYXNlZCBXYXRjaGRvZyBzdXBwb3J0Igo+ID4+ICsgICAg
ICAgZGVwZW5kcyBvbiBSSVNDVl9TQkkKPiA+PiArICAgICAgIGRlZmF1bHQgUklTQ1YKPiA+PiAr
ICAgICAgIHNlbGVjdCBXQVRDSERPR19DT1JFCj4gPgo+ID4gRHJvcCAic2VsZWN0IFdBVENIRE9H
X0NPUkUiIGluc3RlYWQgZXh0ZW5kICJkZXBlbmRzIG9uIgo+ID4gdG8gaW5jbHVkZSBXQVRDSERP
R19DT1JFIChqdXN0IGxpa2Ugb3RoZXIgd2F0Y2hkb2cgZHJpdmVycykuCj4gPgo+Cj4gUGxlYXNl
IGV4cGxhaW4gd2hhdCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgaGVyZS4KPiBMaXRlcmFsbHkgZXZl
cnkgd2F0Y2hkb2cgZHJpdmVyIHVzZXMgInNlbGVjdCBXQVRDSERPR19DT1JFIi4KPgoKUGxlYXNl
IGlnbm9yZSB0aGlzIGNvbW1lbnQuIEkgZ290IGNvbmZ1c2VkIGJ5IHZhcmlvdXMKV0FUQ0hET0df
UFJFVElNRU9VVF94eXoga2NvbmZpZyBvcHRpb25zLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
