Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8D1F3026D
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoNjANthmPoRGHS/+w8Qn1D5wkqVVE9UcjJD0EgH4gw=; b=zjhbeNbQu+6uiH
	w5nCjK2HtLnwmFXuYbe0NRmjrNtNwQEStgo3JVVZqpcbDzhqPuS+nSagLXS3TeLSqVi2HJkM8XGqe
	FgDcls6ROvMCZ/p4gHj6CuCxO0f6VUmguvJXupatCXxLQmn3MU+gh7A7UJcgqYDvptqJEVSSp5deD
	3IqIdltdu6yPjdSbKBTNtUpSiitg8stj3ar/P7ie8nAJZojIAgcaCjQ5f4VD5QNfiW2eMaVhQic+W
	8etFPQ0nPn5Lo1wVQAlbaf2KLmXvP8KKFmTgIVVELqqvRPZQt2/fCdpI0jLyKkYRka9nPcdqvXJiE
	FbrzISGQfrhVzVjJQ5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pCU-00000002lkW-0SEG;
	Sun, 15 Mar 2026 17:24:28 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pCQ-00000002lkA-1veg
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 17:24:24 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso4172646d50.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 10:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773595460; cv=none;
        d=google.com; s=arc-20240605;
        b=W7OOVp7phdvy5S+X5L41Hs4X6JSeiixnbdJ6aR4ngwEV8e+WUfM8OAe364S+a9yE1w
         o6cQlgQVYE7HFLCi5r+7d3dnryzESQMwi5jT0Xdl0FM6oTJTbHP6gUcM8/A6Nw+UzgLp
         GFu0d8maJq5FXHxegvHTK3C5lxYiM02ISIsvZ7yWIBmdMRpOPQFKYHuV9uaLE/226Asn
         DiW7qQW+lPzw+yxYUvWczrFxbE1s9YOU3XXB9qfDhTGrVakeVIM4P84HIyIVmRI4rkZc
         GFWibi4TN1qpU9W8h4oWNZ6JuEndp9WbYBvuDV3Ni5QLOGJEQoJ0B1D+Qii08ABFEo1d
         1WiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4Az3AD3ctAbubU2dZBKCAHmxhpBWtpaolBJU2BIHmU=;
        fh=UfpPKn2YnoSHQrQrKbHtjXgINHD1koRQuohj0rdWSqU=;
        b=daNO+CgucU/PHtqmxN5yIhWO6n2is8iNXmIjAfO0UpRVxps2jFbud9R2VpmFQHEJ+r
         ACHeZBYA7iFb7qclWabbo55QTXVhN+BdqB4aWxSjf/EM7HMdi2JVO18RsMuRP7IftLF1
         zXxGRtKSX61QEC28V0xmbWkfbjMDMqNaPJgMTIbEIHFGMI9NHKMZmW3d1cnBrpVMHgnt
         +SgvDg/eaDm6BzJ+8/8cx3JQw0IDuPo4OPK3x9xDUJYajBpYYHYLOqlQr3JU7kIz53cq
         R3YNiwLQLY/d72YjMPQukZSbI7TuQ+84X3iqHfRG7yQxec8HiX1e8zjtHuhdtMqwlbpg
         6X8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20230601.gappssmtp.com; s=20230601; t=1773595460; x=1774200260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4Az3AD3ctAbubU2dZBKCAHmxhpBWtpaolBJU2BIHmU=;
        b=hs75IVc2FhT5AaSAPxOoSVfKxH/C1Plr+iSnzqbf6DxwaBw3Lc60xPDNRNoxtr/fIC
         lq4ou5vi1jWOXBB/6Y/aUU6vPF7ZHdXxWDSAuxCPXzG1A9aaewFbumtMX2JTghaY9vqx
         ZLWaf6pzEIOo8IH6J6UVa/71UHvwSppfEWkUYeDRXOi6v7uDsNwFCiql83UkZrcsgOQL
         c4uJ4j5a2WlON/YhwGFKCeLIB5ynuh4wb8tJg03S02DjHQ0UWT3kqxeda3say/0NjxdE
         B05j3cU2h43W8roLBJEhaSy3Kv+7/Ru7JHBTMctwVvYy6WYEIhKaVt2YL2ZebFBbM0TH
         Eu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595460; x=1774200260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4Az3AD3ctAbubU2dZBKCAHmxhpBWtpaolBJU2BIHmU=;
        b=TygOOL0AiPdtNKkkGnYYej6eXBqeNELhJLYiDERcYjBsq6f1hkMVMnR3/iY0p7u+qL
         jlYzjoN+xE8+KJEa/dCnh9e68MjUQqKknXv6xyV15gdtk4CzxVhCVxuFet0MKpazEUxn
         6rb+LT3gzGBqwaIeY5QUoJR4KnpX0n40ZcysQh220wrwfffYa3GRScGcfUbgWbLF8Bjj
         rhDVjtXdtlrnMvlBkN2WOq94LgL2OnoBmBH+WDFXNlpzcaphWoUIfa2I/VSr9aO2CgHe
         SvNvh0hqxiXr4zT7Gn2FwxUcsOhGDcmscnhaYu8b5CoYuNI9Qc7D08QeCNNQV2ekAkMY
         svuA==
X-Forwarded-Encrypted: i=1; AJvYcCXyx33+cM1P8K0KcplL6UYc3m6lb9cvV3CAmeo82ttZt2OrXUEB64fPId2JHcSituL2pjWAMdvYJFdzBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfguhyA3I3wyQI2cKhSHoXeEiEFni4QjJHZS9ArVTnmPFTRMBa
	Fdf/unPFo4yYLuBCraXIBnK4tO1XYIezivSda95k+1SSEk23R/DDq/Zqbab3jyOJdbM5mincUlW
	yqGZm+VR5+zYyNLL759EyKNbyYHoTGdGwk52Fd+fSzgk=
X-Gm-Gg: ATEYQzx2knrYIhQO0X3kgpFCIdx5f2EtER8WdejuoHKmZmgZzBelXphTmuxVeXZN5hE
	9UGjqCzhVOfjzBOqafDPKQQmgDqfh4CmkwsJDyfcnDWjh86JkNKatNdIbzJwUXd4tAzvJuRriNk
	2qG6zkPP63Yg2o2NxQfcE+nvL7LkeejWEwJQtWEUzUtBx1YH74+F0C8xHTPRrd1L/D/LmQ4vnCc
	ucLXWsLJZ5Gs6vJ1j2z2Y/SmFdtOSYUfCwlsvXEevuoan7GPJzrXPAya5Ha19EzB/qhtRt0wsbn
	SLCLAmAVlop2PDON5S0s5daBrX6/rHoujv84OHl/
X-Received: by 2002:a53:5a0f:0:b0:64c:a37b:53d2 with SMTP id
 956f58d0204a3-64e62fdbe40mr7873603d50.39.1773595460636; Sun, 15 Mar 2026
 10:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260315-sysmsi-v1-1-5f090c86c2ca@gmail.com>
In-Reply-To: <20260315-sysmsi-v1-1-5f090c86c2ca@gmail.com>
From: Rahul Pathak <rahul@summations.net>
Date: Sun, 15 Mar 2026 22:54:08 +0530
X-Gm-Features: AaiRm50MBFY_3_63SWgnu7L6Bk4J3ywfMt5xcokfpD1ACYf6sCSF9CTMhqIV-0M
Message-ID: <CABdD5x=kMWcmnWZGs6xu_p4GnSJwAg-HSrYepwd3TcLoewWdbg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-rpmi-sysmsi: Fix mailbox channel leak in rpmi_sysmsi_probe()
To: Felix Gu <ustc.gu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102422_604008_335B87DD 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMTI6NDjigK9QTSBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gV2hlbiByaXNjdl9hY3BpX2dldF9nc2lfaW5mbygpIGZhaWxzLCB0
aGUgbWFpbGJveCBjaGFubmVsIHByZXZpb3VzbHkKPiByZXF1ZXN0ZWQgdmlhIG1ib3hfcmVxdWVz
dF9jaGFubmVsKCkgaXMgbm90IGZyZWVkLiBBZGQgdGhlIG1pc3NpbmcKPiBtYm94X2ZyZWVfY2hh
bm5lbCgpIGNhbGwgdG8gcHJldmVudCB0aGUgcmVzb3VyY2UgbGVhay4KPgo+IEZpeGVzOiA0NzUy
YjBjZmJjMzcgKCJpcnFjaGlwL3Jpc2N2LXJwbWktc3lzbXNpOiBBZGQgQUNQSSBzdXBwb3J0IikK
PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtcnBtaS1zeXNtc2kuYyB8IDEgKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LXJwbWktc3lzbXNpLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LXJwbWktc3lz
bXNpLmMKPiBpbmRleCA1Yzc0YzU2MWNlMzEuLjYxMmYzOTcyZjdhZiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LXJwbWktc3lzbXNpLmMKPiArKysgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LXJwbWktc3lzbXNpLmMKPiBAQCAtMjUwLDYgKzI1MCw3IEBAIHN0YXRp
YyBpbnQgcnBtaV9zeXNtc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgICAgICAgICAgcmMgPSByaXNjdl9hY3BpX2dldF9nc2lfaW5mbyhmd25vZGUsICZwcml2
LT5nc2lfYmFzZSwgJmlkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZucl9pcnFzLCBOVUxMKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJjKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgbWJveF9mcmVlX2NoYW5uZWwocHJpdi0+Y2hhbik7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZmluZCBHU0kgbWFw
cGluZ1xuIik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICAgICAgICAg
ICAgICAgICB9Cj4KClJldmlld2VkLWJ5OiBSYWh1bCBQYXRoYWsgPHJhaHVsQHN1bW1hdGlvbnMu
bmV0PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
