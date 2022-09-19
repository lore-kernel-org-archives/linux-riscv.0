Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F3ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHuQQ02+l3tmasTyb2bFTkyKwURxKnl6k5+ni1qd200=; b=eGjjji+bBXj8zm
	NsjqlPyAkjDkOdneCErwRzadT8/q/dEdElH280r5otTIwlCV7MO+NMsKAJwDUYSWV81LFa3EDcwxr
	OuhD5WX6uQznJ11+1Kxrk41NGKwz588esYOF25UgH50V4vfaqKxaqu19Xm5BPcPBglqOtq7XkOOip
	plnFMx1n9LkhizPhQd8qcHFmY5HjxlmrpEGd25JZBGn3BVwU7E8v1E2AaA7w1CH5eIUaVFZ3sbtz3
	dmu3X9FVcToRxKBVMjWLFm+pvaCKBfFt1vS5g/ugL2899FV2d77Etn3Fj4fyskpmOwMdVcU1LC60C
	Dx3KnPZviJJjGFqrnJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDLi-00Aveq-Ib; Mon, 19 Sep 2022 09:45:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDLY-00AvX7-VI
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 09:45:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DCDC617A1;
	Mon, 19 Sep 2022 09:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB7BC433C1;
	Mon, 19 Sep 2022 09:45:43 +0000 (UTC)
Date: Mon, 19 Sep 2022 10:45:39 +0100
From: Conor Dooley <mail@conchuod.ie>
To: linux-riscv@lists.infradead.org, Zeng Heng <zengheng4@huawei.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 sfr@canb.auug.org.au
CC: liwei391@huawei.com
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_-next=5D_riscv=3A_errata=3A_fix_=E2=80=98ri?= =?UTF-8?Q?scv=5Fcbom=5Fblock=5Fsize=E2=80=99_variable_undeclared?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220919094426.860040-1-zengheng4@huawei.com>
References: <20220919094426.860040-1-zengheng4@huawei.com>
Message-ID: <9D6D4DE8-084C-48AC-8103-0C86FD000DD1@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_024549_188618_6A9B5B9A 
X-CRM114-Status: GOOD (  12.44  )
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

CgpPbiAxOSBTZXB0ZW1iZXIgMjAyMiAxMDo0NDoyNSBJU1QsIFplbmcgSGVuZyA8emVuZ2hlbmc0
QGh1YXdlaS5jb20+IHdyb3RlOgo+YXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6IElu
IGZ1bmN0aW9uIOKAmGVycmF0YV9wcm9iZV9jbW/igJk6Cj5hcmNoL3Jpc2N2L2VycmF0YS90aGVh
ZC9lcnJhdGEuYzo0MDoyOiBlcnJvcjog4oCYcmlzY3ZfY2JvbV9ibG9ja19zaXpl4oCZIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmHJpc2N2
X2luaXRfY2JvbV9ibG9ja3NpemXigJk/Cj4gICA0MCB8ICByaXNjdl9jYm9tX2Jsb2NrX3NpemUg
PSBMMV9DQUNIRV9CWVRFUzsKPiAgICAgIHwgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAg
fCAgcmlzY3ZfaW5pdF9jYm9tX2Jsb2Nrc2l6ZQo+Cj4ncmlzY3ZfY2JvbV9ibG9ja19zaXplJyB2
YXJpYWJsZSBzaG91bGQgYmUgZGVjbGFyZWQKPndpdGhvdXQgdGhlIGxpbWl0YXRpb24gd2hldGhl
ciBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JPTQo+aXMgZW5hYmxlZCBvciBub3QuCj4KPlNpZ25lZC1v
ZmYtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmc0QGh1YXdlaS5jb20+CgpUaGlzIHNob3VsZCBhbHJl
YWR5IGJlIGZpeGVkIGluIG5leHQsIG5vPwoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0L2NvbW1pdC8/aD1maXhlcwoKPi0tLQo+
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgMiArLQo+IDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nh
Y2hlZmx1c2guaAo+aW5kZXggYTg5YzAwNWI0YmJmLi43ZWM2MDBhNzE2MzQgMTAwNjQ0Cj4tLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+KysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPkBAIC00Miw4ICs0Miw4IEBAIHZvaWQgZmx1c2hfaWNh
Y2hlX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBib29sIGxvY2FsKTsKPiAKPiAjZW5kaWYgLyog
Q09ORklHX1NNUCAqLwo+IAo+LSNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JPTQo+IGV4dGVy
biB1bnNpZ25lZCBpbnQgcmlzY3ZfY2JvbV9ibG9ja19zaXplOwo+KyNpZmRlZiBDT05GSUdfUklT
Q1ZfSVNBX1pJQ0JPTQo+IHZvaWQgcmlzY3ZfaW5pdF9jYm9tX2Jsb2Nrc2l6ZSh2b2lkKTsKPiAj
ZWxzZQo+IHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKHZvaWQp
IHsgfQo+LS0gCj4yLjI1LjEKPgo+Cj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj5saW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
