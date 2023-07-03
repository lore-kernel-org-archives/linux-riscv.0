Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A210EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+5F8n9fY3l5Yxknh22cxdcZ6EZGWhOMf9UD+opEMN8=; b=k9YO5Vt7QmCGTQ
	RfxGT0U7Fz9Rd+w5xR8kkgN9X6o6f5SQc59ReZ3ZJK2Zj6bV5GOztDbFjXoutdFEB4CoF+0dl4qiM
	JdQlQn3epxMoXaK/Knj3GYOx6EZ3Qf2TsIL9dZl4McrE0etel96I9d5Ojo+ab0yRpHxgKLV+fS1RM
	ALmxpM0E+Db5M6PhS0DbblgOzyFeB1plm13ue+t9SGB/zr/saNKEQemJfI4VX81zKvsUkIWfbEt6I
	0CswjrtSNBTWAZYds7VnjIdfjyNdwmQdm3jl+WVjIdVeTqf217f8ZFgABICbpl04gn/qS59jTSVed
	+gih177wUNjsw2PSJFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEL6-009dgC-10;
	Mon, 03 Jul 2023 07:51:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEL2-009deq-3D
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 07:51:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-314313f127fso1577778f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 00:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688370668; x=1690962668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fS/IGGRRITwIPRcoIR6LDhq8Lu4B/gXKK5zsRtePeA=;
        b=DdvTlJ+dtiJCsFyLdnYP5xkCkkKypgTEbA86g9KlFE6MNjI6Zg/e77/svNL8AxL7or
         wKSJS1fv9nflviz+nJ2oYa75SLer+3OCd0N6oQleC505bLia+dIz+v3FhxWdBpjB8dLR
         qAl95eI6/+iRfB1kcSTEmL7pbzowOgK6B5et20aP1+9TJKcZnnuZKpRMs83ePEnpF9s5
         UxCJuccPtrOR6KWLWMf6YnYpaRduMh7VfTf86HEuwoREyoKnxBAObyElpRPkRI5I4EPb
         ps13JfoxszIZEG5LNSyruQzCTtAZyzQnlj8XdYSYSpvp9W6OTJ7KC5BQnhxsLqFCG7UF
         6CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688370668; x=1690962668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fS/IGGRRITwIPRcoIR6LDhq8Lu4B/gXKK5zsRtePeA=;
        b=YAz7Q5y37Pw7uX+Q4kmnXdmnaZfbEpVRKZzi+Iv5pZ9MZMHISBM+Bia8qV8Z8nSqTP
         BFEvZ5POud61EaX3ayb0JOEStx/eN4nwGDdgOJrpHH7PBi7rXINhIb477hVwasjdJtQd
         1myre4xsPf3WcDHd3aBLcJjir6l+9f+rhwUZu1hjwYqZ2QtY9S+O0S7W+DEVYPyzgIJJ
         otbKD6VKe9b7302GwN+Ib6WXrwCPvXSSuoEKSQnOxTSKgjcW8n+uae7PHe5nUToOmoXE
         lykvXhCInhDiAoYSJGAh5xe0v39rjXdQE9QLbkKZEh6E8BY5iYdgFgdznG+WASwcgzeb
         mrdQ==
X-Gm-Message-State: ABy/qLY8vJhDlg4n8LnAH6qMNph2VKfgEFdmvAb5Ed237nSK3xFnMlgx
	lwr/gXuv1xJ0CP4TilZubpzSKSXvly2hTywuiWSVsHxENG8fEmKIxnNYWA==
X-Google-Smtp-Source: APBJJlH9nqm8zH113ZN2JVzKufZ4X+bFV71Z5uEllOB1mvUR+W7B5XHL4I9sgAPAbxKnG9qHeNCgxwmmvSmgPIWpbBk=
X-Received: by 2002:a5d:4003:0:b0:314:2b0a:dab7 with SMTP id
 n3-20020a5d4003000000b003142b0adab7mr5423229wrp.29.1688370667957; Mon, 03 Jul
 2023 00:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230702095735.860-3-cuiyunhui@bytedance.com>
 <20230702-confiding-aqueduct-25c3c2852de3@spud>
In-Reply-To: <20230702-confiding-aqueduct-25c3c2852de3@spud>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Mon, 3 Jul 2023 15:50:57 +0800
Message-ID: <CAEEQ3wkaazkV9MrfvWQMSXixtqahgdYVe=GT9ZZJnW-r1AQ1aA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 3/3] riscv: obtain SMBIOS entry from FFI.
To: Conor Dooley <conor@kernel.org>
Cc: ardb@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, rminnich@gmail.com, 
	mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org, 
	lenb@kernel.org, jdelvare@suse.com, yc.hung@mediatek.com, 
	angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com, 
	pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	geshijian@bytedance.com, weidong.wd@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_005113_401035_2FE4F3BC 
X-CRM114-Status: GOOD (  11.49  )
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

SGkgQ29ub3IsCgpPbiBTdW4sIEp1bCAyLCAyMDIzIGF0IDg6NDLigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5LAo+Cj4gT24gU3VuLCBKdWwgMDIsIDIw
MjMgYXQgMDU6NTc6MzRQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFdoZW4gd2UgYnJp
bmd1cCB3aXRoIGNvcmVib290IG9uIHJpc2N2LCB3ZSBuZWVkIHRvIG9idGFpbgo+ID4gdGhlIGVu
dHJ5IGFkZHJlc3Mgb2YgU01CSU9TIHRocm91Z2ggdGhlIEZGSSBzY2hlbWUuCj4KPiBXaGF0IGRv
IHlvdSBuZWVkIGl0IGZvcj8KUklTQy1WIHdpbGwgYmUgc2VydmVyLW9yaWVudGVkLCBhbmQgdGhl
IHN5c3RlbSBuZWVkcyB0byBiZSBtYW5hZ2VkCmJhc2VkIG9uIFNNQklPUy4KCgoKPiA+Cj4gPiBA
QCAtMzQsNCArMzUsNyBAQCB2b2lkIF9faW5pdCBmZmlfYWNwaV9yb290X3BvaW50ZXIodm9pZCkK
PiA+ICB2b2lkIF9faW5pdCBmZmlfaW5pdCh2b2lkKQo+ID4gIHsKPiA+ICAgICAgIGZmaV9hY3Bp
X3Jvb3RfcG9pbnRlcigpOwo+ID4gKyNpZiBDT05GSUdfRkRUX0ZXX0lOVEVSRkFDRQo+ID4gKyAg
ICAgZmZpX3NtYmlvc19yb290X3BvaW50ZXIoKTsKPiA+ICsjZW5kaWYKPgo+IFBsZWFzZSBzdHVi
IHRoaXMgZnVuY3Rpb24gc28gdGhhdCB3ZSBkb24ndCBuZWVkIGlmZGVmZmVyeSBoZXJlLgpPSywg
SSB3aWxsIHVwZGF0ZSBpdCBvbiBWMy4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
