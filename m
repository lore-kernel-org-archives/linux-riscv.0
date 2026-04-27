Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367B9FF885E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 11:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4aDe7JG52mRBNNy72rGHjLCB73hzLazO4xCwCqLMLU=; b=HMvMQqCU2HIUic
	tgAyF8zAuTsX3Ttrt1sEtL5HHogKNzAy/rilr7OguReyYysxXERy1Bk36foq7dWnIvPmzPrwpp6Kf
	olQFR0fR6uOWIzGbRHOMtn5HtDBbZok+9cIP8aWOTsOhOm0CDJreD72kFs+joAKP0zNc/p2gf4eEP
	kM8alIUMpl4tTuOPcHVtqDpoM9GnKYkPPgA+k5Kcu3a2IEqw8NvSjz4AinaVfW/xW9i0SgiF38TWe
	ygXdaEE79Vxrq0ybJRn0vjSB/3Fdrq4aiY6Zmi8wyWRyQVuc0P4isdvfnwIaL3DO+b+T6dYoViwg/
	vQsV4ieMyTJoJ23mCz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKL3-0000000Gog3-2ksY;
	Mon, 27 Apr 2026 11:41:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKL0-0000000Gof3-3NCK
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 11:41:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so14503891a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 04:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777290076; cv=none;
        d=google.com; s=arc-20240605;
        b=RG0HMTKn13QZm3j6y7Q/qpT3pehv7e3xGkKx511rEYUBZB0FPit2zs88jSaxLW+ptb
         REC5xI7oBPKik/xoPObXmdZoFTlxznUkaiz03fazRtstLYx7cj37OAUK7tTCZ0PufYFr
         NXawhmjlb7Db+itpFxA7Hc51TNJlSfA11CnP0VczQlFCPGAKOfGXOoJexGv5hq5wOhGl
         DqJX+IbLQha/t7FuwhQZb50WTUBImf6Q3IY94EqV4fgqPulFAfDiGco3UKCf4u98TPtZ
         a5UDWnR4xTu7+Dex+vYd3gtLpUtCMqK+Z16f2vaeSdaH8s5xFsGHwIlt0ddov7c8ZpBd
         /jxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iY9GQ6SW6t/ZOmcGSE+LWGIlAvhxbOuQam/uuJbvUYk=;
        fh=edS3RfpeyNZO8suinP89MJdhwcD5Uu7ZlvyLZPQe5N8=;
        b=ijCn3RkNfGDY0gKSfW/MGo7+v4RcEmB2eCwLhKLO/6PhNT19CFy/hgGQj0oBuUVqf8
         9VoVe1VJn97TRlbTlxDH3+5HEwgkILGdeZvLVSRJ/f3z3s/5/nP7SBWgx3vbbol5zdkM
         YQ3r0xgx9pdZPA+TZuSNwkGxnlZExkz0lYBVlp22JO+BbwoKAJRRClXws8gBi6YsCjSv
         KK0pZ81AsJzNDFusJvlvu3PG/1qGscLAUrp/sUD0tP7WZa5JIaR1K/4FuBzRzL6WSOWH
         Ciy5xwokyJPDV3Doep2zNNs7f7MTyI8jBRUddJSqHTlzMvw+rs1cetg/Vga0YLKNx/wR
         osCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777290076; x=1777894876; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY9GQ6SW6t/ZOmcGSE+LWGIlAvhxbOuQam/uuJbvUYk=;
        b=GJvBW8dpBhVHY4eSvFm20G2bwv5rDjMSEzYLWSxAOb4eqbldjnfjtR1MbyGmRts+a+
         XER5X3yB8AMAL8jtsPVWa1sF4LKtemooe9qtnwPtpqxxAG0c7CE1rexywPTsz5pURx31
         b9MMU4BscPrvy5GZuZpescd68bmtTAtWkf4dFzv3NjscCLQ9Y4hGlwasqIdQUJKCw/Ru
         RDHeiwqX0Zg9NPN6ca5lrsGSnZJIyLfgSyNOSqeZ/Yl/ZZ4nSig9gSD7EkUhHfKfwh+r
         jHuWhiZNyG2nYGpr9P6rAVR1WHbVSn9e3m0BP23n6mq330SinNSC00895xiN3cQeoeaf
         AN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290076; x=1777894876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iY9GQ6SW6t/ZOmcGSE+LWGIlAvhxbOuQam/uuJbvUYk=;
        b=MJgzdDByBn3uk9sZPDP2IPokDyXPBKK1Lfv8ZAuacXSxA6UnG6IanwwflEuL7yk9qH
         3HQQKAeHRDQ0xYaDg6+1xnZ8fxi22DVl/WtG7m4o0xFX+ITAUwwPl6Bf7TRMqYTf7p/a
         QCSErBlwS26ywOBV111pmZLU45I4tOmh6TLG5FmQoE6cw7rJiFoKsdd+siLMZFtRrmFj
         ceFBuDVNThd0wVobpPxrn6mb3WZ19AuHjl6p7NWGK3TJs2g3gVh18GbNC3XiESBqQ4da
         lqFLHH1Y6Xn1EGaslH7Xc7ETxjbjTKivJFrGXI/NEUsW4q/uvrxb4OMoMOVktTfUlMxV
         1HQg==
X-Forwarded-Encrypted: i=1; AFNElJ9+VtOXdaxb2lgF0hdGm0uHfN0v+F4T3O0Y7IthxlXd714SBL8zsOaoz4hdy1dUrINEmvVWU2GtRUZLSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWvmgi0By/FQgn9QRHmd3FWRk/yMGElBFzAn2BTeDO8fqPBe0v
	1kTiys4wxhT+rZfSfWMB+HVfdGuvttY72hUM8YCMZ/bWzQ7pa5iM5Kklx5ENQrn7FPRHPRF3MUm
	qpTCv4hqI1uEIhoJm/BwjX5isWHyPlsAfqGb+22FgZQ==
X-Gm-Gg: AeBDiesNUJamsI39+JwfiKM0j97JwZEhEJDv1ttyohbhqAJggt3mCa3DBSW8NyeEdgU
	YQ8E19+kFHZwVN4BXqu6QDij66rz7EzPbmnQSAa8ZpJP2C8CKryNNM9JqAxTCAcWDeoSeqgwITM
	lO+MdgzgmMxlm60i3yOFY80Ycu80zQ0zxlFmd8xx4zRrUWVKn35e4tJtl9kN3DHN1L4A6DqG53C
	mEMM7cl0WwraoUKkBjAo5GpEGKHLsCUrq0g8QFFDDavXM3sj7oJ73r5ZnjKD5dsj4+wjxtuj3Oz
	qpg//EdVlebDpbWmDXi9hQLW9fuL2UTcYp2zF3RQn+H258cL
X-Received: by 2002:a17:907:c002:b0:ba8:e7d5:6a7a with SMTP id
 a640c23a62f3a-ba8e7e4ae93mr1628539066b.40.1777290076003; Mon, 27 Apr 2026
 04:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251204101730.1036671-1-arnd@kernel.org> <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com> <aTbCqyOuprPOyU4X@sumit-X1>
 <2c0d09b7-0d8c-4bf2-a1bd-1dc4b58cd0a8@oss.qualcomm.com> <3aacf997-3a21-4e4b-b6bd-c55c36fb4c74@oss.qualcomm.com>
 <CAHUa44GO-D1YcQ_36pe-vQ83fB9rcOkny+M7a=CThAxWb6TLTQ@mail.gmail.com>
 <ba8554b7-499b-4fb8-b792-471d83cf3893@oss.qualcomm.com> <CAHUa44GaKGhDuNcMqn0c0UgK-CV3bHoUE_Q_X-0ZY+jNEs9ZcQ@mail.gmail.com>
In-Reply-To: <CAHUa44GaKGhDuNcMqn0c0UgK-CV3bHoUE_Q_X-0ZY+jNEs9ZcQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 27 Apr 2026 13:41:01 +0200
X-Gm-Features: AVHnY4LqpVnmdMXbDD6cxcuJmHloWDSIDrfMnjtLJlqIAFhprhXXROKSuZO99EE
Message-ID: <CAHUa44GNiTeRoL_AUbge4DmCBVqpaeNEoqoWdTPrhiQDBjzOjw@mail.gmail.com>
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Etienne Carriere <etienne.carriere@foss.st.com>, Randy Dunlap <rdunlap@infradead.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_044119_110937_1A88113A 
X-CRM114-Status: GOOD (  33.23  )
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

SGksCgpPbiBUdWUsIERlYyAxNiwgMjAyNSBhdCAyOjE34oCvUE0gSmVucyBXaWtsYW5kZXIKPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBUdWUsIERlYyAx
NiwgMjAyNSBhdCAxMTo1NuKAr0FNIEhhcnNoYWwgRGV2Cj4gPGhhcnNoYWwuZGV2QG9zcy5xdWFs
Y29tbS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEplbnMsCj4gPgo+ID4gT24gMTIvMTYvMjAyNSAx
OjE4IFBNLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiA+ID4gSGksCj4gPiA+Cj4gPiA+IE9uIFR1
ZSwgRGVjIDksIDIwMjUgYXQgNDo1NOKAr0FNIEFtaXJyZXphIFphcnJhYmkKPiA+ID4gPGFtaXJy
ZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gSGksCj4g
PiA+Pgo+ID4gPj4gT24gMTIvOC8yMDI1IDExOjU0IFBNLCBIYXJzaGFsIERldiB3cm90ZToKPiA+
ID4+Pgo+ID4gPj4+Cj4gPiA+Pj4gT24gMTIvOC8yMDI1IDU6NTAgUE0sIFN1bWl0IEdhcmcgdmlh
IE9QLVRFRSB3cm90ZToKPiA+ID4+Pj4gT24gTW9uLCBEZWMgMDgsIDIwMjUgYXQgMDQ6MjQ6MTdQ
TSArMTEwMCwgQW1pcnJlemEgWmFycmFiaSB3cm90ZToKPiA+ID4+Pj4+IEhpLAo+ID4gPj4+Pj4K
PiA+ID4+Pj4+IE9uIDEyLzUvMjAyNSAxMjoyNyBBTSwgSmVucyBXaWtsYW5kZXIgd3JvdGU6Cj4g
PiA+Pj4+Pj4gSGksCj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+PiBPbiBUaHUsIERlYyA0LCAyMDI1IGF0
IDExOjE34oCvQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+
Pj4+Pj4KPiA+ID4+Pj4+Pj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+
ID4+Pj4+Pj4KPiA+ID4+Pj4+Pj4gVGhlIHRlZV9pb2N0bF9vYmplY3RfaW52b2tlX2FyZyBzdHJ1
Y3R1cmUgaGFzIHBhZGRpbmcgb24gc29tZQo+ID4gPj4+Pj4+PiBhcmNoaXRlY3R1cmVzIGJ1dCBu
b3Qgb24geDg2LTMyIGFuZCBhIGZldyBvdGhlcnM6Cj4gPiA+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+IGlu
Y2x1ZGUvbGludXgvdGVlLmg6NDc0OjMyOiBlcnJvcjogcGFkZGluZyBzdHJ1Y3QgdG8gYWxpZ24g
J3BhcmFtcycgWy1XZXJyb3I9cGFkZGVkXQo+ID4gPj4+Pj4+Pgo+ID4gPj4+Pj4+PiBJIGV4cGVj
dCB0aGF0IGFsbCBjdXJyZW50IHVzZXJzIG9mIHRoaXMgYXJlIG9uIGFyY2hpdGVjdHVyZXMgdGhh
dCBkbwo+ID4gPj4+Pj4+PiBoYXZlIGltcGxpY2l0IHBhZGRpbmcgaGVyZSAoYXJtNjQsIGFybSwg
eDg2LCByaXNjdiksIHNvIG1ha2UgdGhlIHBhZGRpbmcKPiA+ID4+Pj4+Pj4gZXhwbGljaXQgaW4g
b3JkZXIgdG8gYXZvaWQgc3VycHJpc2VzIGlmIHRoaXMgbGF0ZXIgZ2V0cyB1c2VkIGVsc2V3aGVy
ZS4KPiA+ID4+Pj4+Pj4KPiA+ID4+Pj4+Pj4gRml4ZXM6IGQ1YjhiMGZhMTc3NSAoInRlZTogYWRk
IFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfT0JKUkVGIikKPiA+ID4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+ID4+Pj4+Pj4gLS0tCj4gPiA+
Pj4+Pj4+IFRoZSBuZXcgaW50ZXJmYWNlIHNob3dlZCB1cCBpbiA2LjE4LCBidXQgSSBvbmx5IGNh
bWUgYWNyb3NzIHRoaXMgYWZ0ZXIKPiA+ID4+Pj4+Pj4gdGhhdCB3YXMgcmVsZWFzZWQuIENoYW5n
aW5nIGl0IG5vdyBpcyB0ZWNobmljYWxseSBhbiBBQkkgY2hhbmdlIG9uCj4gPiA+Pj4+Pj4+IGFy
Y2hpdGVjdHVyZXMgd2l0aCB1bnVzdWFsIHBhZGRpbmcgcnVsZXMsIHNvIHBsZWFzZSBjb25zaWRl
ciBjYXJlZnVsbHkKPiA+ID4+Pj4+Pj4gd2hldGhlciB3ZSB3YW50IHRvIGRvIGl0IHRoaXMgd2F5
IG9yIG5vdC4KPiA+ID4+Pj4+Pj4KPiA+ID4+Pj4+Pj4gV29ya2luZyBhcm91bmQgdGhlIEFCSSBk
aWZmZXJlbmNlcyB3aXRob3V0IGFuIEFCSSBjaGFuZ2UgaXMgcG9zc2libGUsCj4gPiA+Pj4+Pj4+
IGJ1dCBhZGRzIGEgbG90IG9mIGNvbXBsZXhpdHkgZm9yIGNvbXBhdCBoYW5kbGluZy4KPiA+ID4+
Pj4+Pgo+ID4gPj4+Pj4+IFRoaXMgaXMgY3VycmVudGx5IG9ubHkgdXNlZCBieSB0aGUgcmVjZW50
bHkgaW50cm9kdWNlZCBxY29tdGVlIGJhY2tlbmQKPiA+ID4+Pj4+PiBkcml2ZXIuIFNvIGl0J3Mg
b25seSB1c2VkIG9uIGEgZmV3IGFybTY0IFF1YWxjb21tIHBsYXRmb3JtcyByaWdodCBub3cuCj4g
PiA+Pj4+Pj4KPiA+ID4+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCB0YWtlIHRoaXMgcGF0Y2gsIGJ1
dCBsZXQncyBoZWFyIHdoYXQgb3RoZXJzIHRoaW5rLgo+ID4gPj4+Pgo+ID4gPj4+PiBZZWFoIHNp
bmNlIGl0J3Mgbm90IGFuIEFCSSBpc3N1ZSBvbiBhcm02NCBwbGF0Zm9ybXMgd2hlcmUgUVRFRSBy
dW5zLCBzbzoKPiA+ID4+Pj4KPiA+ID4+Pj4gUmV2aWV3ZWQtYnk6IFN1bWl0IEdhcmcgPHN1bWl0
LmdhcmdAb3NzLnF1YWxjb21tLmNvbT4KPiA+ID4+Pj4KPiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+IFRo
YW5rcywKPiA+ID4+Pj4+PiBKZW5zCj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBJIGFn
cmVlLiBXZSBzaG91bGQgdGFrZSB0aGlzIHBhdGNoLiBBcyBub3RlZCwgdGhlcmUgYXJlIG5vdCBt
YW55Cj4gPiA+Pj4+PiBjbGllbnRzIHJlbHlpbmcgb24gaXQgeWV0LCBzbyB1cGRhdGluZyB0aGUg
dXNlcnNwYWNlIHNob3VsZAo+ID4gPj4+Pj4gYmUgc3RyYWlnaHRmb3J3YXJkLgo+ID4gPj4+Pgo+
ID4gPj4+PiBZb3Ugc2hvdWxkIHJhdGhlciB0ZXN0IHdpdGhvdXQgYW55IHVzZXJzcGFjZSBsaWJy
YXJ5IHVwZGF0ZSB0byB0ZXN0IGl0J3MKPiA+ID4+Pj4gbm90IGFuIEFCSSBpc3N1ZS4gSnVzdCBm
b3IgY29ycmVjdG5lc3Mgc2FrZSwgeW91IGNhbiB1cGRhdGUgdGhlIGxpYnJhcnkKPiA+ID4+Pj4g
dG9vLgo+ID4gPj4+Pgo+ID4gPj4+Cj4gPiA+Pj4gSSdsbCB0YWtlIHRoZSB0aW1lIHRvIHRlc3Qg
aXQgYXQgc29tZSBwb2ludCB0aGlzIHdlZWsgYm90aCB3aXRoIGFuZCB3aXRob3V0IHVwZGF0aW5n
Cj4gPiA+Pj4gdGhlIGxpYnJhcnkgQUJJLgo+ID4gPj4+Cj4gPiA+Pgo+ID4gPj4gU3VtbWl0LCB0
aGF0IHdhcyB0aGUgcGxhbiBmcm9tIHRoZSBiZWdpbm5pbmcsIHRoYXQncyB3aHkgSSBkaWQgbm90
IGFkZCAiUmV2aWV3ZWQtYnk6Igo+ID4gPj4gaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGFua3MgSGFy
c2hhbCBmb3Igdm9sdW50ZWVyaW5nLgo+ID4gPgo+ID4gPiBBcmUgd2UgZ29vZCB3aXRoIHRoaXMg
cGF0Y2ggbm93Pwo+ID4gPgo+ID4KPiA+IFllcywgdGhpcyBpcyBnb29kIGZyb20gb3VyIHNpZGUu
Cj4gPgo+ID4gVGVzdGVkLWJ5OiBIYXJzaGFsIERldiA8aGFyc2hhbC5kZXZAb3NzLnF1YWxjb21t
LmNvbT4KPgo+IEdvb2QsIHRoYW5rIHlvdSwgSGFyc2hhbC4KPgo+IFJldmlld2VkLWJ5OiBKZW5z
IFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4KPgo+IEFybmQsIHdoYXQgZG8g
eW91IHByZWZlciwgdGFraW5nIHRoaXMgZGlyZWN0bHkgb3Igc2hvdWxkIEkgc2VuZCBpdCBpbgo+
IGEgcHVsbCByZXF1ZXN0PwoKSSBmb3Jnb3QgYWJvdXQgdGhpcy4gSSdtIHBpY2tpbmcgdXAgdGhp
cy4KCkNoZWVycywKSmVucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
