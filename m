Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21CDC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/E6UpGhsZiNuWNM5xt42qmCTUG7cqa0l96zGR04+9EA=; b=uEhXOCRHYXnU4o
	SZSpHr1H4htHiXdU62XyK6ltBnoyAAghRoQjeQk8nNQxckvOIp+42JN5HaWWht6nfQhlplKv02Ulk
	aKQeOxCjzUzhSFnhOrmZRuHFjQeg2K+1ARqh3mfKjg/DhyDMPZ5fc6uDuhwALlRrnvpjEamU/Zw+4
	RCD0JAHcO9dImavqaSvKFFS5HhbsYbKci/P8jTp3CzO4ReDlOeifpcElxeiX07QOcLq5Hf6VCha6B
	RmR6Js+6qSDNPbYLn74flIP7pkZ9u0xNFPxTp6MBMJKuV7YtuRZAtx6B9P52xm5eMGYaToAKDmmiX
	cco6pa/Z6teHb0TrQJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAwF-00Ctt4-Pd; Mon, 06 Mar 2023 13:31:39 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAwC-00CtrG-Lq
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 13:31:38 +0000
Received: by mail-vs1-xe30.google.com with SMTP id s1so9107681vsk.5
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678109494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ9Z+QjshNd3gtr/tqh4VVlvtOXWb9XUhmUt7dCXpH4=;
        b=LLU0A82e4APRGmZq6n8jT2pEtq2QFRtRtHA0tV2Wi5YPoYEMVSbQQceuUOrmo7lVTK
         a1K3CxJoSJCKayrGR48iuX+IeUWC6sKvaA/DZFkvS2YuHyGI1wxVc4ieUNgR7Efb6TQT
         ovozsUpHUaDJE69aNbjGEBX++PK5FwkqK5HxPJa0ahZi8G0CezLPkpz73/DbVxop92od
         FErJx66506N4C9tR6CrH2iASb6uQO+XtQJ8IvMPJw8+SO3P0OXvh+KxWomX+RYCJzdZX
         Pe44qLXdPaKXQkNWD1SsjkqbD5zX6WZlDq0YAVX2qDtX6MMU8syp413dKjFALs1fsIoX
         Nw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678109494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ9Z+QjshNd3gtr/tqh4VVlvtOXWb9XUhmUt7dCXpH4=;
        b=Ii0Z5BGMTphqCtvPj+YkuHcQQqpa60tEn4pqRgxEuRVXAMvOzQZY5jUNyn9SO04ps0
         AKj4YOE4dG6OvdXtnXPyuyFOzbyi8CM2tnts7MA0XcWy2643mQciC8DbuTA/Soyx2TVn
         UY8l4ssq84WKN1Y3UBOBda9S8NNc9lt/xU7x77eyBnnHNs9JQLJ98JBJ5HEKCDop29Wq
         OWb74SEA56Xmi7sqQnk3zH77fRXexHKdOngTenCDoNqfuJ0g5ebjNRuyPbmIedYS7ilh
         WThID0korICb+42Z0wFZsfPUCbBUgmuc29978uTaO7Nb5Dbmre8YZiM94VnUri/zDcIo
         T4wg==
X-Gm-Message-State: AO0yUKXACZCYNN9qyoAZ/j6eIh0iH9pQeENY/+XECVNu+U6B0ckkqdgW
	QQWhK/Q91/ALlxluYWHSUA4TaPIr/w2KzuC6B6iKwg==
X-Google-Smtp-Source: AK7set/QDiyJnrM1LDBNPHKMfvXJcktaeA5G3e7zGD4z1DlF6JSHVYAg8WIavFxvtBEf9defwaIUlyVloBmhCe1VTw4=
X-Received: by 2002:a67:b40b:0:b0:402:9b84:1bde with SMTP id
 x11-20020a67b40b000000b004029b841bdemr7115746vsl.0.1678109494025; Mon, 06 Mar
 2023 05:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20230210142711.1177212-1-rkanwal@rivosinc.com>
In-Reply-To: <20230210142711.1177212-1-rkanwal@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 6 Mar 2023 19:01:23 +0530
Message-ID: <CAK9=C2XzTD95W-QfwF0px26DyDD9AAx_qX3we-zeMzOK7EHr4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] riscv/kvm: Fix VM hang in case of timer delta
 being zero.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_053136_730724_E125BAD1 
X-CRM114-Status: GOOD (  18.70  )
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

T24gRnJpLCBGZWIgMTAsIDIwMjMgYXQgNzo1N+KAr1BNIFJham5lc2ggS2Fud2FsIDxya2Fud2Fs
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBJbiBjYXNlIHdoZW4gVkNQVSBpcyBibG9ja2VkIGR1
ZSB0byBXRkksIHdlIHNjaGVkdWxlIHRoZSB0aW1lcgo+IGZyb20gYGt2bV9yaXNjdl92Y3B1X3Rp
bWVyX2Jsb2NraW5nKClgIHRvIGtlZXAgdGltZXIgaW50ZXJydXB0Cj4gdGlja2luZy4KPgo+IEJ1
dCBpbiBjYXNlIHdoZW4gZGVsdGFfbnMgY29tZXMgdG8gYmUgemVybywgd2UgbmV2ZXIgc2NoZWR1
bGUKPiB0aGUgdGltZXIgYW5kIFZDUFUga2VlcHMgc2xlZXBpbmcgaW5kZWZpbml0ZWx5IHVudGls
IGFueSBhY3Rpdml0eQo+IGlzIGRvbmUgd2l0aCBWTSBjb25zb2xlLgo+Cj4gVGhpcyBpcyBlYXNp
bHkgcmVwcm9kdWNlLWFibGUgdXNpbmcga3ZtdG9vbC4KPiAuL2xrdm0tc3RhdGljIHJ1biAtYzEg
LS1jb25zb2xlIHZpcnRpbyAtcCAiZWFybHljb24gcm9vdD0vZGV2L3ZkYSIgXAo+ICAgICAgICAg
IC1rIC4vSW1hZ2UgLWQgcm9vdGZzLmV4dDQKPgo+IEFsc28sIGp1c3QgYWRkIGEgcHJpbnQgaW4g
a3ZtX3Jpc2N2X3ZjcHVfdnN0aW1lcl9leHBpcmVkKCkgdG8KPiBjaGVjayB0aGUgaW50ZXJydXB0
IGRlbGl2ZXJ5IGFuZCBydW4gYHRvcGAgb3Igc2ltaWxhciBhdXRvLXVwYXRpbmcKPiBjbWQgZnJv
bSBndWVzdC4gV2l0aGluIHNvbWV0aW1lIG9uZSBjYW4gbm90aWNlIHRoYXQgcHJpbnQgZnJvbQo+
IHRpbWVyIGV4cGlyeSByb3V0aW5lIHN0b3BzIGFuZCB0aGUgYHRvcGAgY21kIG91dHB1dCB3aWxs
IHN0b3AKPiB1cGRhdGluZy4KPgo+IFRoaXMgY2hhbmdlIGZpeGVzIHRoaXMgYnkgbWFraW5nIHN1
cmUgd2Ugc2NoZWR1bGUgdGhlIHRpbWVyIGV2ZW4KPiB3aXRoIGRlbHRhX25zIGJlaW5nIHplcm8g
dG8gYnJpbmcgdGhlIFZDUFUgb3V0IG9mIHNsZWVwIGltbWVkaWF0ZWx5Lgo+Cj4gRml4ZXM6IDhm
NWNiNDRiMWJhZSAoIlJJU0MtVjogS1ZNOiBTdXBwb3J0IHNzdGMgZXh0ZW5zaW9uIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBSYWpuZXNoIEthbndhbCA8cmthbndhbEByaXZvc2luYy5jb20+CgpRdWV1ZWQg
dGhpcyBwYXRjaCBmb3IgTGludXgtNi4zIGZpeGVzLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IHYy
OiBBZGRlZCBGaXhlcyB0YWcgaW4gY29tbWl0IG1lc3NhZ2UuCj4KPiB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjMwMjEwMTM1MTM2LjExMTUyMTMtMS1ya2Fud2FsQHJpdm9zaW5j
LmNvbS8KPgo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgfCA2ICsrLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGlt
ZXIuYwo+IGluZGV4IGFkMzQ1MTljOGExMy4uM2FjMmZmNmE2NWRhIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGlt
ZXIuYwo+IEBAIC0xNDcsMTAgKzE0Nyw4IEBAIHN0YXRpYyB2b2lkIGt2bV9yaXNjdl92Y3B1X3Rp
bWVyX2Jsb2NraW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+Cj4gICAgICAgICBkZWx0YV9ucyA9IGt2bV9yaXNjdl9kZWx0YV9jeWNsZXMybnModC0+
bmV4dF9jeWNsZXMsIGd0LCB0KTsKPiAtICAgICAgIGlmIChkZWx0YV9ucykgewo+IC0gICAgICAg
ICAgICAgICBocnRpbWVyX3N0YXJ0KCZ0LT5ocnQsIGt0aW1lX3NldCgwLCBkZWx0YV9ucyksIEhS
VElNRVJfTU9ERV9SRUwpOwo+IC0gICAgICAgICAgICAgICB0LT5uZXh0X3NldCA9IHRydWU7Cj4g
LSAgICAgICB9Cj4gKyAgICAgICBocnRpbWVyX3N0YXJ0KCZ0LT5ocnQsIGt0aW1lX3NldCgwLCBk
ZWx0YV9ucyksIEhSVElNRVJfTU9ERV9SRUwpOwo+ICsgICAgICAgdC0+bmV4dF9zZXQgPSB0cnVl
Owo+ICB9Cj4KPiAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfdGltZXJfdW5ibG9ja2luZyhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gLS0KPiAyLjI1LjEKPgo+Cj4gLS0KPiBrdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cj4ga3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
