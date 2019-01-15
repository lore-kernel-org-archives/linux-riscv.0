Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CF8C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4B1F20645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csTtO03o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+Fto5br"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4B1F20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJM+j0jiGegizKiArqDA6UxXfOPS8hj4udXIpJzYCvI=; b=csTtO03os1OIn8
	u1V8rY9pWHqIdsYF/ftIFb8pxsqOqv4S3kNA5W8wNS3oR2vq0csw9iSOO7rzJRWUeut4MgyoJ1KdQ
	PDwDLROgFr0KrBpRLqzLvsz8SdbefcYoCwVhzEtoNA5/qYvzcw62cjNhNT2emlMvt87mPeKN/2qTb
	get7+M+Gfm4OcyG11hflGzC26z6kqSG+/ybmjgHtruPAgdzdDouF3FH9dKQNGyTYH/dUozhiD7qPF
	nHp24TkLqEpn4VjCWfB8Y8vbXx8US/70urnhx+oGKFH91cU6sr2G5cpP/6x/w6xcuLZorpj3oPkHa
	c+fjCQWsZ8YD2enE0U9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRBg-0007k4-9Y; Tue, 15 Jan 2019 16:03:36 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRBc-0007j8-CH
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 16:03:34 +0000
Received: by mail-qk1-x742.google.com with SMTP id y16so1820520qki.7
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jan 2019 08:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DVd51KsOzAxlSEHo1Wfu9Ox/v6YXFVIWNbi0FbKWkJY=;
 b=g+Fto5breoSO7kKXQrsHmPDWsP3U0jfnludXWQWZ2CyWMsL/SGA3sL3jKAgunjNVH4
 MckAwYFEDlCT/5z54LOqS8GvLcBJXGoXs09U+d5vu/Ct1esx8BPRV8/XA2WAiBt4NXMU
 QSmt9NOC4XS/jKPDeqA1DlCdSfROHmbrA1C2EpGsxbtw2db682mMlTQhOkndpFWTPlc4
 6U8KxPENAsrjF1AC2ReF0HUByJRXhcJye6D8CmW31rXfrqKSngx2rumQISH4Q2foAOkQ
 F1iMzF37f6VUwwPxP1sPmBB/3c1dDjtWrgGxvauMkdWgXa7nT8IST/jomBOLTakZJlvl
 E3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DVd51KsOzAxlSEHo1Wfu9Ox/v6YXFVIWNbi0FbKWkJY=;
 b=WyMHvmzaTFnHaOctwiNDaC8t5MeLasqLdtFARpF/SyCbycNkA2m8+hiKAphJOUq9le
 S2/Ky/ttmH9slOw4J/GTMovnmfjBtjvk4uTXGjCevd7UJWGhDmg0FLJOu1eLCijvZpLk
 FcqLJPIHzjtcww7PBLYRcdZ3zeNvNfGKPSglWAwpqxjqRspe8yHjniZ4ShpsKqcHg9kT
 Avky0KudKRB9598J5J19pd5Two5s7B8F7Tk7Uc7YG5tYyP3sOKvRRn/ojM1ca6sqYKHg
 anDOGEmYkO544b5DkBnMq7x3AtKJhZgh6VUG1gEnrkx1Lx5ZAqjcR/7+e5WACZdqVjTZ
 7Yng==
X-Gm-Message-State: AJcUukcHmj8L8itzTUpSiA2OevbeuKkdjATAzAMWmnXACQHdPLv/aFMc
 67BsiWIa+Mx/0XbG8lk1ASVRdCccjEI77Jmtsyo=
X-Google-Smtp-Source: ALg8bN4h15xhgM/TG3pAPuMgajqH7s0QwUChCBOU9YA+lqCGaeLMnohnYcbRZLuO1oECVoZ5o00rkOw3n/gDIUvafBI=
X-Received: by 2002:a37:4289:: with SMTP id p131mr3252015qka.3.1547568210915; 
 Tue, 15 Jan 2019 08:03:30 -0800 (PST)
MIME-Version: 1.0
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
 <20190115154012.GG26443@infradead.org>
In-Reply-To: <20190115154012.GG26443@infradead.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 15 Jan 2019 17:03:18 +0100
Message-ID: <CAJ+HfNhHUCM_YPUF01s=Tgh-M1_PMF6Jev1PQjwqfgva0vgeLw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] RV64G eBPF JIT
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_080332_452196_919A87F6 
X-CRM114-Status: GOOD (  21.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Daniel Borkmann <daniel@iogearbox.net>,
 davidlee@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RGVuIHRpcyAxNSBqYW4uIDIwMTkga2wgMTY6NDAgc2tyZXYgQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBpbmZyYWRlYWQub3JnPjoKPgo+IEhpIEJqw7ZybiwKPgo+IGF0IGxlYXN0IGZvciBtZSBwYXRj
aCAzIGRpZG4ndCBtYWtlIGl0IHRvIHRoZSBsaXN0Lgo+CgpIbW0sIGhlbGQgYmFjazogIllvdXIg
bWVzc2FnZSB0byBsaW51eC1yaXNjdiBhd2FpdHMgbW9kZXJhdG9yCmFwcHJvdmFsIi4gRXhjZWVk
ZWQgdGhlIDQwayBsaW1pdC4KCkknbGwgd2FpdCB1bnRpbCB0aGUgbW9kZXJhdG9yIHdha2VzIHVw
IChQYWxtZXI/KS4KCgpCasO2cm4KCj4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDk6MzU6MTVB
TSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+IEhpIQo+ID4KPiA+IEkndmUgYmVlbiBo
YWNraW5nIG9uIGEgUlY2NEcgZUJQRiBKSVQgY29tcGlsZXIsIGFuZCB3b3VsZCBsaWtlIHNvbWUK
PiA+IGZlZWRiYWNrLgo+ID4KPiA+IENvZGV3aXNlLCBpdCBuZWVkcyBzb21lIHJlZmFjdG9yaW5n
LiBDdXJyZW50bHkgdGhlcmUncyBhIGJpdCB0b28gbXVjaAo+ID4gY29weS1hbmQtcGFzdGUgZ29p
bmcgb24sIGFuZCBJIGtub3cgc29tZSBwbGFjZXMgd2hlcmUgSSBjb3VsZCBvcHRpbWl6ZQo+ID4g
dGhlIGNvZGUgZ2VuZXJhdGlvbiBhIGJpdCAobW9zdGx5IEJQRl9LIHR5cGUgb2YgaW5zdHJ1Y3Rp
b25zLCBkZWFsaW5nCj4gPiB3aXRoIGltbWVkaWF0ZXMpLgo+ID4KPiA+IEZyb20gYSBmZWF0dXJl
cyBwZXJzcGVjdGl2ZSwgdHdvIHRoaW5ncyBhcmUgbWlzc2luZzoKPiA+Cj4gPiAqIHRhaWwgY2Fs
bHMKPiA+ICogImZhci1icmFuY2hlcyIsIGkuZS4gY29uZGl0aW9uYWwgYnJhbmNoZXMgdGhhdCBy
ZWFjaCBiZXlvbmQgMTNiLgo+ID4KPiA+IFRoZSB0ZXN0X2JwZi5rbyAob25seSB0ZXN0ZWQgb24g
NC4yMCEpIHBhc3NlcyBhbGwgdGVzdHMuCj4gPgo+ID4gSSd2ZSBkb25lIGFsbCB0aGUgdGVzdHMg
b24gUUVNVSAodmVyc2lvbiAzLjEuNTApLCBzbyBubyByZWFsIGhhcmR3YXJlLgo+ID4KPiA+IFNv
bWUgcXVlc3Rpb25zL29ic2VydmF0aW9uczoKPiA+Cj4gPiAqIEkndmUgYWRkZWQgIkhBVkVfRUZG
SUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MiIHRvCj4gPiAgIGFyY2gvcmlzY3YvS2NvbmZpZy4gSXMg
dGhpcyBhc3N1bXB0aW9uIGNvcnJlY3Q/Cj4gPgo+ID4gKiBlbWl0X2ltbSgpIGp1c3QgcmVsaWVz
IG9uIGx1aSwgYWRkcyBhbmQgc2hpZnRzLiBObyBmYW5jeSB4b3JpIGNvc3QKPiA+ICAgb3B0aW1p
emF0aW9ucyBsaWtlIEdDQyBkb2VzLgo+ID4KPiA+ICogU3VnZ2VzdGlvbnMgb24gaG93IHRvIGlt
cGxlbWVudCB0aGUgdGFpbCBjYWxsLCBnaXZlbiB0aGF0IHRoZQo+ID4gICBwcm9sb2d1ZS9lcGls
b2d1ZSBoYXMgdmFyaWFibGUgc2l6ZS4gSSB3aWxsIGRpZyBpbnRvIHRoZSBkZXRhaWxzIG9mCj4g
PiAgIG1pcHMvYXJtNjQveDg2LiA6LSkKPiA+Cj4gPiBOZXh0IHN0ZXBzIChwcmlvciBwYXRjaCBw
cm9wZXIpIGlzIGNsZWFuaW5nIHVwIHRoZSBjb2RlLCBhZGQgdGFpbAo+ID4gY2FsbHMsIGFuZCBt
YWtpbmcgc3VyZSB0aGF0IGJwZnRvb2wgZGlzYXNzZW1ibHkgd29ya3MgY29ycmVjdGx5Lgo+ID4K
PiA+IEFsbCBpbnB1dCBhcmUgd2VsY29tZS4gVGhpcyBpcyBteSBmaXJzdCBSSVNDLVYgaGFjaywg
c28gSSBzdXJlIHRoZXJlCj4gPiBhcmUgYSBsb3QgdGhpbmdzIHRvIGltcHJvdmUhCj4gPgo+ID4K
PiA+IFRoYW5rcywKPiA+IEJqw7Zybgo+ID4KPiA+Cj4gPiBCasO2cm4gVMO2cGVsICgzKToKPiA+
ICAgcmlzY3Y6IHNldCBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gPiAgIHJpc2N2
OiBhZGQgYnVpbGQgaW5mcmEgZm9yIEpJVCBjb21waWxlcgo+ID4gICBicGYsIHJpc2N2OiBhZGRl
ZCBlQlBGIEpJVCBmb3IgUlY2NEcKPiA+Cj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgfCAgICAyICsKPiA+ICBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAgICB8ICAgIDQgKwo+
ID4gIGFyY2gvcmlzY3YvbmV0L01ha2VmaWxlICAgICAgIHwgICAgNSArCj4gPiAgYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wLmMgfCAxNjEyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTYyMyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbmV0L01ha2VmaWxlCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcC5jCj4gPgo+ID4gLS0KPiA+IDIuMTkuMQo+
ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cj4gLS0tZW5kIHF1b3RlZCB0ZXh0LS0tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
