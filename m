Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B648C79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJfV4o3qrj7hQAuRYFMmrJWP6cOedb07gfsx9wTfTxc=; b=erlhq1gs/YPoLJ
	SdOKAozJ9Q3ZlyOzV9EJSnQcQjsZuHsjaxuxFz1I2asoWNHUiCqwOiBfrmuZ1gTVnVekkLQsVlnn8
	xf6w1QuahQxQTDNZeSC9b/2xNTNEteShboB1tfksflm+DyM7okKEzhTKRdAgxkejwoIJa8HsHslUT
	KEM5v2RFhaPXuZXQYmhdYC/x4zxD0cE/P4KH7hmEofqzZu8WKZYDluFk3vClwPtt1p6Qv6/DV1iWm
	9A+mggBWRnEgjgGHrxXy8CPpSshJCfkv5uYAwMdqmuNEMDYcC6RC90UjEVJcowmVdMnGekQDRCIQY
	i+HXH87zAiIJbY/tUEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Yx0-00000006sSE-2Yre;
	Mon, 07 Sep 2026 12:59:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ywx-00000006sPy-0dbo
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 12:59:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso33397235e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788785989; x=1789390789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fedd1Lk8v7XqLnYfi6ACsWWe1EX73jfitPVMPywY8zQ=;
        b=Tj5dgvcEkNXiQ7/8zW3fflvG+9iOGnasFbHG6mD4Gg9tsuaqjp4k05gtdfTYJdJd9+
         w8XnlmElhjo8UuwuOMzsmxFg9F2M35xoTyMSop7HDCCzfQKPeMeslFkhdKeYVIBr50eb
         eExbfkqj4S23OcIx5TOTT17fBs2Ui8YuLSiZVhs3v5fpgIt2/yqkoFVeM9V/+ImDFLci
         FWmep5sBWWgCA+zvYAQYmgDmcqVOTV16rrMLjXPl6cc61XOy/gv/fsHdlAPD53a6YZzq
         lV5nqQoRFaFFLH2xatKP9SeeJ4ZVmvksxz8nj0Ujy6XmT02HZtIl6ySEFlCNiP5ljaEo
         UQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785989; x=1789390789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fedd1Lk8v7XqLnYfi6ACsWWe1EX73jfitPVMPywY8zQ=;
        b=MjlZKb18OCmp7DsxVIcAzUd1cU4JIPxChRHkZ8YdLEN9S+8dgDSY3ABppnsQZKgdAE
         cbAYG8RQL8qhVr4cQe4f4iVrB8Pb3o3/CHLYzI1FxAEHuaQmPE1DxJalwV6KCt+WvzOf
         cVbL2nDIaGVzBd7uMae181dXhdHeu4b1MeFWpSwsoiSnrULGX4+b+N3rLKCb96UO6Mic
         HR15x8tcnhF53JkBqyp5/dLoDuq5HikIN7kSy7R3x4GHYa2y8b+xn4h19oa2N9UmxiYu
         yUilFhgp/sHylV7UM8NME6roxiVHNt/zU7jpQ/9Y2/QXrJrrXo+TXZq2u8JmiiYE0taG
         4C+A==
X-Forwarded-Encrypted: i=1; AKwUvByAh00dFdBatQCiSxjo4xNpbMwmBZCa34CFkNfCDvr9vi87EbFsaqg7fvNKkyRy6mQ0T7c1VeTMz2GOWw==@lists.infradead.org
X-Gm-Message-State: AFuF++ln85jzD7zw4al3d2qC3Rg4kKvg080dM5JnDpY6/mYElKq6wVPF
	v04qZBaadEqO2wI+vwftneJwbWwXJqRBX6pI3bpO6YtlnEi2kFLrtvGH
X-Gm-Gg: AYBFou0ucuwP7eA+q7UzNLV9S3qXAxtJbilrAdPoqkknygje3aTKcBicXoIBdpHsczR
	vjelXVTjhMZt48QU5WMH2/LgoBo65MCxut3JPKsWP+yFR3U32zff6ZQcQxFg8oeE4unJRlVCILH
	PImWvozJO3vHlVdb/vKFQlTexjMk+WZt96Oidrc3tY363yOnYVkuhCjZVm2wMX8i06SRJZrs74B
	Xe5TghmtHkO2h0WNacli6Wxy7z5VeE7/SSVCYFqgpKbOA3UGDZyLcsX+rn20qcJz6Fl2iHWx1JO
	I08XPYVUHe9WObLG87VNXvIdlkXqzFvcTdKwmzajhLvc7cuefA6OBHkeHoR0CJc+ZZI7s9now5l
	y61GMGUfy/MUZzwZHYqfqz/iIUFgxFJ+P9gf/v3jxcmuNAsNiHKLFxvVGMF6ti0dC8BEo+zSDju
	hGGGmaARlkMgweLCuerEcbU5/t7pzVVoG3ZqNbBJaltXB6PwuLzl71ShTQNlqtmozduCxhGVb/1
	YeATBi5J3vBZLNdRa5wfSyujA==
X-Received: by 2002:a05:600c:c162:b0:49d:16dc:e721 with SMTP id 5b1f17b1804b1-49d16dce7aamr16981995e9.24.1788785988330;
        Mon, 07 Sep 2026 05:59:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm306405115e9.6.2026.09.07.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:59:47 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:59:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Petr Mladek <pmladek@suse.com>, <bcrl@kvack.org>,
 <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <jack@suse.cz>,
 <tytso@mit.edu>, <adilger.kernel@dilger.ca>, <libaokun@linux.alibaba.com>,
 <ojaswin@linux.ibm.com>, <ritesh.list@gmail.com>, <yi.zhang@huawei.com>,
 <sforshee@kernel.org>, <akpm@linux-foundation.org>, <rostedt@goodmis.org>,
 <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
 <senozhatsky@chromium.org>, <kees@kernel.org>, <tglx@kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-aio@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/8] Convert barrier pairs to acquire/release for
 better performance
Message-ID: <20260907135946.2541aa7e@pumpkin>
In-Reply-To: <75aeca50-74bf-4888-9dc8-7ac3c5af32ca@huawei.com>
References: <20260902074805.398540-1-ruanjinjie@huawei.com>
	<apq5iLOF8lAQ_ZVU@pathway.suse.cz>
	<75aeca50-74bf-4888-9dc8-7ac3c5af32ca@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_055951_228183_FB268299 
X-CRM114-Status: GOOD (  41.72  )
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

T24gTW9uLCA3IFNlcCAyMDI2IDE5OjI5OjA2ICswODAwCkppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgoKPiDlnKggMjAyNi85LzQgMjA6MjgsIFBldHIgTWxhZGVrIOWG
memBkzoKPiA+IEFkZGluZyBSaXNjLVYgbGlzdCBpbnRvIENjLgo+ID4gCj4gPiBPbiBXZWQgMjAy
Ni0wOS0wMiAxNTo0Nzo1NywgSmluamllIFJ1YW4gd3JvdGU6ICAKPiA+PiBIaSwKPiA+Pgo+ID4+
IFRoaXMgc2VyaWVzIGNvbnZlcnRzIHNvbWUgZXhpc3Rpbmcgc21wX3dtYigpL3NtcF9ybWIoKSBi
YXJyaWVyIHBhaXJzIHRvCj4gPj4gc21wX3N0b3JlX3JlbGVhc2UoKS9zbXBfbG9hZF9hY3F1aXJl
KCkgYWNyb3NzIHZhcmlvdXMgc3Vic3lzdGVtcy4KPiA+Pgo+ID4+IEJhY2tncm91bmQKPiA+PiA9
PT09PT09PT09Cj4gPj4KPiA+PiBNYW55IGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBsb2FkIGFjcXVp
cmUgYW5kIHN0b3JlIHJlbGVhc2UgaW5zdHJ1Y3Rpb25zCj4gPj4gd2hpY2ggY2FuIHJlcGxhY2Ug
ZXhwbGljaXQgbWVtb3J5IGJhcnJpZXJzIGFuZCBzYXZlIGN5Y2xlcy4gQXMgbm90ZWQKPiA+PiBp
biB0aGUgQVJNIGFyY2hpdGVjdHVyZSByZWZlcmVuY2UgWzFdOgo+ID4+Cj4gPj4gICAiV2Vha2Vy
IG9yZGVyaW5nIHJlcXVpcmVtZW50cyB0aGF0IGFyZSBpbXBvc2VkIGJ5IExvYWQtQWNxdWlyZSBh
bmQKPiA+PiAgICBTdG9yZS1SZWxlYXNlIGluc3RydWN0aW9ucyBhbGxvdyBmb3IgbWljcm8tYXJj
aGl0ZWN0dXJhbAo+ID4+ICAgIG9wdGltaXphdGlvbnMsIHdoaWNoIGNvdWxkIHJlZHVjZSBzb21l
IG9mIHRoZSBwZXJmb3JtYW5jZSBpbXBhY3RzCj4gPj4gICAgdGhhdCBhcmUgb3RoZXJ3aXNlIGlt
cG9zZWQgYnkgYW4gZXhwbGljaXQgbWVtb3J5IGJhcnJpZXIuCj4gPj4KPiA+PiAgICBJZiB0aGUg
b3JkZXJpbmcgcmVxdWlyZW1lbnQgaXMgc2F0aXNmaWVkIHVzaW5nIGVpdGhlciBhIExvYWQtQWNx
dWlyZQo+ID4+ICAgIG9yIFN0b3JlLVJlbGVhc2UsIHRoZW4gaXQgd291bGQgYmUgcHJlZmVyYWJs
ZSB0byB1c2UgdGhlc2UKPiA+PiAgICBpbnN0cnVjdGlvbnMgaW5zdGVhZCBvZiBhIERNQi4iCj4g
Pj4KPiA+PiBPbiBhcm02NCwgYSB0eXBpY2FsIHNlcWNvdW50IFsyXSByZWFkIGxvb3AgcmVxdWly
ZXMgMTMgY3ljbGVzIHdpdGggRE1CCj4gPj4gYmFycmllcnMuIFJlcGxhY2luZyB0aGUgcmVhZCBi
YXJyaWVyIHdpdGggc21wX2xvYWRfYWNxdWlyZSgpIHJlZHVjZXMKPiA+PiB0aGlzIHRvIDggY3lj
bGVzIG9uIGFuIEFtcGVyZSBBbHRyYS4gIAo+ID4gCj4gPiBJIHdvbmRlciBpZiB0aGlzIGlzIHRy
dWUgb24gYWxsIG90aGVyIGFyY2hpdGVjdHVyZXM6Cj4gPiAKPiA+ICAgKyBJdCBzZWVtcyB0aGF0
IEFybSBnZXRzIHRoZSBnYWluIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uCj4gPiAgICAgZG9lcyBi
b3RoIGxvYWQvc3RvcmUgKyBiYXJyaWVyLiBJdCBoZWxwcyBldmVuIHdoZW4KPiA+ICAgICB0aGUg
YmFycmllciBpcyBmdWxsLgo+ID4gCj4gPiAgICsgU29tZSBvdGhlciBhcmNoaXRlY3R1cmVzIG5l
ZWQgdHdvIGluc3RydWN0aW9ucy4gT25lIGZvciB0aGUKPiA+ICAgICBsb2FkL3N0b3JlIGFuZCB0
aGUgb3RoZXIgZm9yIHRoZSBiYXJyaWVyLiBCdXQgdGhlIGJhcnJpZXIKPiA+ICAgICBpcyB3ZWFr
ZXIsIGl0IHN5bmNocm9uaXplcyBqdXN0IHJlYWRzIG9yIGp1c3Qgd3JpdGVzLgo+ID4gCj4gPiBG
b3IgZXhhbXBsZSwgSSBzZWUgdGhlIGZvbGxvd2luZyBpbiByaXNjdi9pbmNsdWRlL2FzbS9iYXJy
aWVyLmg6Cj4gPiAKPiA+IDxwYXN0ZSByaXNjdi9pbmNsdWRlL2FzbS9iYXJyaWVyLmg+Cj4gPiAj
ZGVmaW5lIHNtcF9tYigpCVJJU0NWX0ZFTkNFKHJ3LCBydykKPiA+ICNkZWZpbmUgc21wX3JtYigp
CVJJU0NWX0ZFTkNFKHIsIHIpCj4gPiAjZGVmaW5lIHNtcF93bWIoKQlSSVNDVl9GRU5DRSh3LCB3
KQo+ID4gCj4gPiAjZGVmaW5lIHNtcF9zdG9yZV9yZWxlYXNlKHAsIHYpCQkJCQkJXAo+ID4gZG8g
ewkJCQkJCQkJCVwKPiA+IAlSSVNDVl9GRU5DRShydywgdyk7CQkJCQkJXAo+ID4gCVdSSVRFX09O
Q0UoKnAsIHYpOwkJCQkJCVwKPiA+IH0gd2hpbGUgKDApCj4gPiAKPiA+ICNkZWZpbmUgc21wX2xv
YWRfYWNxdWlyZShwKQkJCQkJCVwKPiA+ICh7CQkJCQkJCQkJXAo+ID4gCXR5cGVvZigqcCkgX19f
cDEgPSBSRUFEX09OQ0UoKnApOwkJCQlcCj4gPiAJUklTQ1ZfRkVOQ0UociwgcncpOwkJCQkJCVwK
PiA+IAlfX19wMTsJCQkJCQkJCVwKPiA+IH0pCj4gPiA8L3Bhc3RlIHJpc2N2L2luY2x1ZGUvYXNt
L2JhcnJpZXIuaD4KPiA+IAo+ID4gSSB3b25kZXIgd2hldGhlcjoKPiA+IAo+ID4gICArIFJJU0NW
X0ZFTkNFKHIsIHIpIGlzIGZhc3RlciB0aGFuIFJJU0NWX0ZFTkNFKHIsIHJ3KQo+ID4gICArIFJJ
U0NWX0ZFTkNFKHcsIHcpIGlzIGZhc3RlciB0aGFuIFJJU0NWX0ZFTkNFKHJ3LCB3KQo+ID4gCj4g
PiBzbyBpdCBtaWdodCBjYXVzZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHRoZXJlLi4uICAKPiAK
PiBIaSBQZXRyLAo+IAo+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGFuYWx5c2lzLiBZb3UncmUg
cmlnaHQgdGhhdCBvbiBzb21lCj4gYXJjaGl0ZWN0dXJlcyB0aGUgYWNxdWlyZS9yZWxlYXNlIHZh
cmlhbnRzIHVzZSBhIHNsaWdodGx5IGhlYXZpZXIKPiBmZW5jZSB0aGFuIHRoZSBwbGFpbiBzbXBf
d21iKCkvc21wX3JtYigpIHBhaXIuIFRoZSBmdWxsIHBpY3R1cmUgYnkKPiBhcmNoaXRlY3R1cmU6
Cj4gCj4gICBhcm02NDogICAgSW1wcm92ZW1lbnQgICAoRE1CIElTSFNUL0lTSExEICsgU1RSL0xE
UiDihpIgU1RMUi9MREFSKQo+ICAgeDg2OiAgICAgIE5ldXRyYWwgICAgICAgKGJvdGggYXJlIGNv
bXBpbGVyIGJhcnJpZXJzKQo+ICAgczM5MDogICAgIE5ldXRyYWwgICAgICAgKGJvdGggYXJlIGNv
bXBpbGVyIGJhcnJpZXJzKQo+ICAgcHBjNjQ6ICAgIE5ldXRyYWwgICAgICAgKGJvdGggdXNlIGx3
c3luYykKPiAgIGxvb25nYXJjaDogU2xpZ2h0bHkgaGVhdmllciBmZW5jZSAoREJBUihvX3dfdykg
4oaSIERCQVIob3J3X3cpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERCQVIob3Jfcl8p
IOKGkiBEQkFSKG9yX3J3KSkKPiAgIHJpc2N2OiAgICBTbGlnaHRseSBoZWF2aWVyIGZlbmNlIChm
ZW5jZSB3LHcg4oaSIGZlbmNlIHJ3LHcsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgZmVu
Y2UgcixyIOKGkiBmZW5jZSByLHJ3KQo+IAo+IFNvIG9uIExvb25nYXJjaCBhbmQgUmlzY3YsIHRo
ZXJlIG1heSBiZSBhIHNsaWdodCBwZXJmb3JtYW5jZSByZWdyZXNzaW9uLgoKSXMgdGhhdCBhIGJ1
ZyBpbiB0aGUgcmlzY3YgZGVmaW5pdGlvbnM/Ck5vdGhpbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
cyBzZWVtcyB0byBpbmRpY2F0ZSB3aHkgdGhlIHN0cm9uZ2VyIGJhcnJpZXJzCmFyZSB1c2VkLgpU
aGUgb3JpZ2luYWwgY29tbWl0IDhkMjM1YjE3IHdhcyBkb25lIHRvIGF2b2lkIHRoZSBydyxydyBi
YXJyaWVyIGluIHRoZQpnZW5lcmljIGNvZGUgKHdoaWNoIG1pZ2h0IHNpbmNlIGhhdmUgYmVlbiBy
ZWxheGVkKS4KCkRhdmlkCgo+IAo+IFJlZ2FyZHMsCj4gSmluamllCj4gCj4gPiAKPiA+IEJlc3Qg
UmVnYXJkcywKPiA+IFBldHIKPiA+ICAgCj4gPj4gV2UgYWxzbyBvYnNlcnZlZCBzaWduaWZpY2Fu
dCBiYXJyaWVyIG92ZXJoZWFkIHdoaWxlIHByb2ZpbGluZyBVbnhpYmVuY2gKPiA+PiBzeXNjYWxs
IHRlc3Qgb24gYXJtNjQ6IGEgc2luZ2xlIGdldHVpZCgpIGNhbGwgaXMgfjhucyBzbG93ZXIgdGhh
biBvbgo+ID4+IGEgY29tcGFyYWJsZSB4ODYgc3lzdGVtLCB3aXRoIHRoZSBkb21pbmFudCBjb3N0
IGluIG1hcF9pZF91cCgpJ3Mgc21wX3JtYigpLAo+ID4+IHdoaWNoIGlzIGEgRE1CIElTSExEIG9u
IGFybTY0LiBDb252ZXJ0aW5nIGl0IHRvIHNtcF9sb2FkX2FjcXVpcmUoKSBhbGxvd3MKPiA+PiB0
aGUgdXNlIG9mIExEQVIsIGVsaW1pbmF0aW5nIHRoZSBtZWFzdXJhYmxlIG92ZXJoZWFkLgo+ID4+
Cj4gPj4gVGhpcyBtb3RpdmF0ZWQgYSBicm9hZGVyIHNlYXJjaCBmb3IgZXhpc3RpbmcgYmFycmll
ciBwYWlycyB0aGF0IGNhbgo+ID4+IGJlIGNvbnZlcnRlZCB0byB0aGUgbGlnaHRlciBhY3F1aXJl
L3JlbGVhc2Ugc2VtYW50aWNzLgo+ID4+Cj4gPj4gQ2hhbmdlcwo+ID4+ID09PT09PT0KPiA+Pgo+
ID4+IEVhY2ggcGF0Y2ggaW4gdGhpcyBzZXJpZXMgdGFyZ2V0cyBhIHNwZWNpZmljIGJhcnJpZXIg
cGFpciB3aGVyZSB0aGUKPiA+PiBwdWJsaXNoL3N1YnNjcmliZSBwYXR0ZXJuIGlzIGFscmVhZHkg
cHJlc2VudDoKPiA+Pgo+ID4+IC0gV3JpdGVycyBwb3B1bGF0ZSBkYXRhLCB0aGVuIHB1Ymxpc2gg
YSBmbGFnL2NvdW50L3BvaW50ZXIgdmlhCj4gPj4gICBzbXBfc3RvcmVfcmVsZWFzZSgpCj4gPj4K
PiA+PiAtIFJlYWRlcnMgbG9hZCB0aGUgZmxhZy9jb3VudC9wb2ludGVyIHZpYSBzbXBfbG9hZF9h
Y3F1aXJlKCksIHRoZW4KPiA+PiAgIGNvbnN1bWUgdGhlIGRhdGEKPiA+Pgo+ID4+IFRoaXMgcHJl
c2VydmVzIHRoZSBleGlzdGluZyBtZW1vcnkgb3JkZXJpbmcgZ3VhcmFudGVlcyB3aGlsZSBhbGxv
d2luZwo+ID4+IGFyY2hpdGVjdHVyZXMgd2l0aCBuYXRpdmUgYWNxdWlyZS9yZWxlYXNlIGluc3Ry
dWN0aW9ucyAoZS5nLiBhcm02NCdzCj4gPj4gU1RMUi9MREFSKSB0byBhdm9pZCB0aGUgY29zdCBv
ZiBmdWxsIG9uZS13YXkgYmFycmllcnMgKERNQiBJU0hTVC9JU0hMRCkuCj4gPj4gT24gYXJjaGl0
ZWN0dXJlcyB3aXRob3V0IG5hdGl2ZSBzdXBwb3J0LCB0aGUgZ2VuZXJhdGVkIGNvZGUgaXMKPiA+
PiBnZW5lcmFsbHkgbm8gd29yc2UgdGhhbiB0aGUgZXhwbGljaXQgYmFycmllciBwYWlyLgo+ID4+
Cj4gPj4gVGhlIGNvbnZlcnNpb25zIGFyZSBtZWNoYW5pY2FsIGFuZCBubyBmdW5jdGlvbmFsIGNo
YW5nZSBpcyBpbnRlbmRlZC4KPiA+Pgo+ID4+IFRlc3RpbmcgKEt1bnBlbmcgSElQMDkgYXJtNjQg
c2VydmVyKQo+ID4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4+Cj4g
Pj4gMS4gVU5JWEJFTkNIIHN5c2NhbGwKPiA+PiAJQmFzZWxpbmU6IDcxNS4yNwo+ID4+IAlQYXRj
aGVkOiAgNzE4LjgzCj4gPj4gCUltcHJvdmVtZW50OiArMC41MCUKPiA+Pgo+ID4+IDIuIGZzL2Fp
byAoZmlvICsgbnVsbF9ibGssIDQgam9icyk6Cj4gPj4gCUJhc2VsaW5lOiAxNDQxayBJT1BTLCA4
Ni40NnVzCj4gPj4gCVBhdGNoZWQ6ICAxNDUyayBJT1BTLCA4NS44MHVzCj4gPj4gCUltcHJvdmVt
ZW50OiB+MC44JQo+ID4+Cj4gPj4gQm90aCBpbXByb3ZlbWVudHMgYXJlIGNvbnNpc3RlbnQgYWNy
b3NzIHJ1bnMgYW5kIGFsaWduIHdpdGggdGhlCj4gPj4gZXhwZWN0ZWQgc2F2aW5ncyBmcm9tIHJl
cGxhY2luZyBETUIgd2l0aCBMREFSL1NUTFIgb24gYXJtNjQuCj4gPj4KPiA+PiBbMV06IGh0dHBz
Oi8vc3VwcG9ydC5hcm0uY29tL2RvY3VtZW50YXRpb24vMTAyMzM2LzAxMDAvTG9hZC1BY3F1aXJl
LWFuZC1TdG9yZS1SZWxlYXNlLWluc3RydWN0aW9ucwo+ID4+IFsyXTogaHR0cHM6Ly9naXRodWIu
Y29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9kMGRkMDY2YTBmYTI2ZDU1YzE5YWNlOWU4OWRlZGQ5
NTA0YzViY2JhCj4gPj4KPiA+PiBDaGFuZ2VzIGluIHYzOgo+ID4+IC0gQWRkIFJldmlld2VkLWJ5
Lgo+ID4+IC0gU3BsaXQgb3V0IG5ldHdvcmsgcGF0Y2ggc2V0IGFzIEt1bml5dWtpIHN1Z2dlc3Rl
ZC4KPiA+PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkw
MTAyNDIzNC4xMzUxMTktMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4gPj4KPiA+PiBDaGFuZ2Vz
IGluIHYyOgo+ID4+IC0gRml4IHByZS1leGlzdGluZyBpc3N1ZSBmb3IgZXh0NCBhbmQgODAyMXEg
WzNdLgo+ID4+IC0gRml4IG1pc3NpbmcgY29weV9tbnRfaWRtYXAoKSB1ZGFwdGUgWzNdLgo+ID4+
IC0gRHJvcCBuYWNrZWQgaXNvdHAgcGF0Y2guCj4gPj4gLSBBZGQgdGVzdCBkYXRhLgo+ID4+IC0g
QWRkIFJldmlld2VkLWJ5IGFuZCB1cGRhdGUgZnMgcGF0Y2ggYXMgSmFuIHN1Z2dlc3RlZC4KPiA+
Pgo+ID4+IFszXTogaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODI1MDk1NDIy
LjMxNjYwNjctMS1ydWFuamluamllJTQwaHVhd2VpLmNvbQo+ID4+Cj4gPj4gSmluamllIFJ1YW4g
KDgpOgo+ID4+ICAgdXNlcl9uYW1lc3BhY2U6IFVzZSBhY3F1aXJlL3JlbGVhc2UgZm9yIG5yX2V4
dGVudHMgc3luY2hyb25pemF0aW9uCj4gPj4gICBsaWIvdnNwcmludGY6IFVzZSBhY3F1aXJlL3Jl
bGVhc2UgZm9yIHB0cl9rZXkgcHVibGljYXRpb24KPiA+PiAgIGZzOiBhaW86IFVzZSBhY3F1aXJl
L3JlbGVhc2UgZm9yIHJpbmctPnRhaWwgcHVibGljYXRpb24KPiA+PiAgIGZzOiBVc2UgYWNxdWly
ZS9yZWxlYXNlIGZvciBmZHRhYmxlIHJlc2l6ZSBzeW5jaHJvbml6YXRpb24KPiA+PiAgIHBpZGZz
OiBVc2UgdGVzdF9iaXRfYWNxdWlyZSgpIGZvciBhdHRyIGZsYWcgdGVzdHMKPiA+PiAgIHN1cGVy
OiBVc2UgYWNxdWlyZSBmb3IgU0JfQk9STiBjaGVjayBpbiBzdXBlcl9jYWNoZV9jb3VudCgpCj4g
Pj4gICBleHQ0OiBGaXggb3V0LW9mLWJvdW5kcyByZWFkIGluIGV4dDRfZ2V0X2dyb3VwX2luZm8o
KQo+ID4+ICAgZXh0NDogQ29udmVydCBncm91cC1jb3VudCBiYXJyaWVyIHByb3RvY29sIHRvIGFj
cXVpcmUvcmVsZWFzZQo+ID4+Cj4gPj4gIGZzL2Fpby5jICAgICAgICAgICAgICAgIHwgMTAgKysr
Ky0tLS0tLQo+ID4+ICBmcy9leHQ0L2JhbGxvYy5jICAgICAgICB8ICAyICstCj4gPj4gIGZzL2V4
dDQvZXh0NC5oICAgICAgICAgIHwgMTAgKysrLS0tLS0tLQo+ID4+ICBmcy9leHQ0L21iYWxsb2Mu
YyAgICAgICB8ICA2ICsrLS0tLQo+ID4+ICBmcy9leHQ0L3Jlc2l6ZS5jICAgICAgICB8IDE5ICsr
KysrKysrKysrLS0tLS0tLS0KPiA+PiAgZnMvZmlsZS5jICAgICAgICAgICAgICAgfCAxMCArKysr
LS0tLS0tCj4gPj4gIGZzL21udF9pZG1hcHBpbmcuYyAgICAgIHwgIDUgKystLS0KPiA+PiAgZnMv
cGlkZnMuYyAgICAgICAgICAgICAgfCAgNiArKy0tLS0KPiA+PiAgZnMvc3VwZXIuYyAgICAgICAg
ICAgICAgfCAgNiArKy0tLS0KPiA+PiAga2VybmVsL3VzZXJfbmFtZXNwYWNlLmMgfCAyNCArKysr
KysrKysrKysrLS0tLS0tLS0tLS0KPiA+PiAgbGliL3ZzcHJpbnRmLmMgICAgICAgICAgfCAxMSAr
KysrLS0tLS0tLQo+ID4+ICAxMSBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA2MSBk
ZWxldGlvbnMoLSkKPiA+Pgo+ID4+IC0tIAo+ID4+IDIuMzQuMSAgCj4gCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
