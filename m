Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4454C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CS9LBv8mtAxvTZXazIYVfWqYPToNKzpKCffBbJk7YI=; b=mHdiK5nP+Iqu94
	jEm7gEJgxw2OuvDayW5/JdnJXEquTYXh6/Szoih/rBt8qrzIH8/QlgnjQDLXhr5gb9Mzz8sJdoJLh
	ErImYh/K+dsAX0YNdKquuBZejN0yocj9Tl0CbfY+DWiR5JNhmZyKKpF9rYjz/txQi7fz05DGY+M94
	BUZeVFRJZQFEzhDQL5prnRy7LIymkqWiqe73ayHYCb3dgkUyUnH+d3/1bhcyPneB70y7tfzALZSOZ
	oZe/cgYusBk+3vXkPmfyb0/PR2q2PFE1gLOJxI6MRixz+lkyOqFcFW8xkdrCwfEwVnhFQoe/CxIAv
	CgYgP/Vwyqe6TW36rbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0jh-005lr8-1L;
	Wed, 19 Jul 2023 06:32:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0jf-005lq3-1l
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dkfu4+zrfsEvNM/oP4wLx2h/8nsgQPK5hugPJnR2T8Y=; b=QM/W1Mh6mVFdR2XKiBvx6crXG/
	Nde+CpuuW84F3Mag19S162DO9xYQJjNGADMuvLt4sqNom1V2NGqOuNc7JkkB3lUKsxAyVycQYMJkp
	U3leqafCKBoD24h6naJLx6oB0EBJFpnLyRtIFTg8cjQwzi+54KzPUfy30MtTS/hTEvL2pxy7TnSIC
	citXuqe4t05ghJpxJwOP6m+EkD5J1XhCwCGTtXIPN0iA+VoepmRWMxqJ56raeHxYDWYxWh3G2A/j7
	V1R3FqdKpPYmihO+pNUbasIq52T3r3UbMulomLv4JVZqZ1rvC5rs+Bof1LI/1F2K3c7ZrRBGFyxUM
	l30MDTIA==;
Received: from mail-yb1-f180.google.com ([209.85.219.180])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhQO-00BNad-0v
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 09:55:22 +0000
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-ccc462deca6so3199803276.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 02:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689674111; x=1692266111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkfu4+zrfsEvNM/oP4wLx2h/8nsgQPK5hugPJnR2T8Y=;
        b=Gt0Atn+xQoyu+J9NDeKQeyFw2H5FAqdJHyOwP23uD7w1V4B7GQsr2zFUzVJ0E/bgCK
         ZIgXtWiOeFaMagU5iZaCKbNzfRrvkVjPD+o11hyFgX5PoaHBkKkGt289FHW89njIMfEd
         K+bWtv3jQtz5JL0J/FHIh12b54KlVVfb+Ha6IaK3Fje7k28GGNJQluD1NnszSFtfreWO
         jQQiEJRcozJjHoDSg8hwiy9oVXgRdFmnrOEaE3L9EFZ0a1x6OWsA6csZzCCbjdnfo5/t
         4OxrATXV/GE/zzHyj7+EwEu1YyNrAkm4xx0W1nBn2H6AW04Aipybttci9eIIFQ+9m1Nz
         /0Qg==
X-Gm-Message-State: ABy/qLY+vuNZR8BrvKLGEOW7HXboci32l18Gv+elBvT7MtMzv1pXdV/C
	Bh7COtCChoSz+nzBSRzjXOHsNiVJyDRW0A==
X-Google-Smtp-Source: APBJJlH2DD8JttcOo/n5u4vdcwR3W+IvwxbPdzIwAfJEUyUK9AwHIfZk23tV2w2cTn9sd6idbaoOkg==
X-Received: by 2002:a25:d2ce:0:b0:bad:fb1:a9f9 with SMTP id j197-20020a25d2ce000000b00bad0fb1a9f9mr2574201ybg.62.1689674111394;
        Tue, 18 Jul 2023 02:55:11 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id v1-20020a056902028100b00cc4d979f3besm322598ybh.58.2023.07.18.02.55.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 02:55:10 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so5807288276.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 02:55:10 -0700 (PDT)
X-Received: by 2002:a25:860f:0:b0:cec:59f7:b352 with SMTP id
 y15-20020a25860f000000b00cec59f7b352mr989091ybk.58.1689674110647; Tue, 18 Jul
 2023 02:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org> <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org> <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org> <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com> <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
In-Reply-To: <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2023 11:54:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
Message-ID: <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE mechanism)
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-team@meta.com, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, linux-rtc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, netdev <netdev@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_105520_482232_6B44EBBE 
X-CRM114-Status: GOOD (  29.75  )
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

SGkgVGVqdW4sCgpPbiBUdWUsIEp1bCAxOCwgMjAyMyBhdCAxOjAz4oCvQU0gVGVqdW4gSGVvIDx0
akBrZXJuZWwub3JnPiB3cm90ZToKPiBDYW4geW91IHBsZWFzZSB0aGUgZm9sbG93aW5nIHBhdGNo
IGFuZCBzZWUgaG93IG1hbnkgcmVwb3J0cyB5b3UgZ2V0PyBMb29raW5nCj4gYmFjayBhdCB5b3Vy
IHJlcG9ydHMsIEkgdGhpbmsgc29tZSBvZiB0aGVtIHByb2JhYmx5IHNob3VsZCBiZSBjb252ZXJ0
ZWQgdG8KPiBVTkJPVU5EIGJ1dCB3ZSBzaG91bGQgaGF2ZSBhIGJldHRlciBpZGVhIHdpdGggdGhl
IGFkanVzdGVkIHRocmVzaG9sZC4KPgo+IFRoYW5rcy4KPgo+IEZyb20gODU1NWNiZDRiMjJlNWY4
NWViMmJkY2I4NGZkMWQxZjUxOWEwYTBkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9t
OiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+Cj4gRGF0ZTogTW9uLCAxNyBKdWwgMjAyMyAxMjo1
MDowMiAtMTAwMAo+IFN1YmplY3Q6IFtQQVRDSF0gd29ya3F1ZXVlOiBTY2FsZSB1cCB3cV9jcHVf
aW50ZW5zaXZlX3RocmVzaF91cyBpZiBCb2dvTUlQUyBpcwo+ICBiZWxvdyAxMDAwCj4KPiB3cV9j
cHVfaW50ZW5zaXZlX3RocmVzaF91cyBpcyB1c2VkIHRvIGRldGVjdCBDUFUtaG9nZ2luZyBwZXIt
Y3B1IHdvcmsgaXRlbXMuCj4gT25jZSBkZXRlY3RlZCwgdGhleSdyZSBleGNsdWRlZCBmcm9tIGNv
bmN1cnJlbmN5IG1hbmFnZW1lbnQgdG8gcHJldmVudCB0aGVtCj4gZnJvbSBibG9ja2luZyBvdGhl
ciBwZXItY3B1IHdvcmsgaXRlbXMuIElmIENPTkZJR19XUV9DUFVfSU5URU5TSVZFX1JFUE9SVCBp
cwo+IGVuYWJsZWQsIHJlcGVhdCBvZmZlbmRlcnMgYXJlIGFsc28gcmVwb3J0ZWQgc28gdGhhdCB0
aGUgY29kZSBjYW4gYmUgdXBkYXRlZC4KPgo+IFRoZSBkZWZhdWx0IHRocmVzaG9sZCBpcyAxMG1z
IHdoaWNoIGlzIGxvbmcgZW5vdWdoIHRvIGRvIGZhaXIgYml0IG9mIHdvcmsgb24KPiBtb2Rlcm4g
Q1BVcyB3aGlsZSBzaG9ydCBlbm91Z2ggdG8gYmUgdXN1YWxseSBub3Qgbm90aWNlYWJsZS4gVGhp
cwo+IHVuZm9ydHVuYXRlbHkgbGVhZHMgdG8gYSBsb3Qgb2YsIGFyZ3VhYmxlIHNwdXJpb3VzLCBk
ZXRlY3Rpb25zIG9uIHZlcnkgc2xvdwo+IENQVXMuIFVzaW5nIHRoZSBzYW1lIHRocmVzaG9sZCBh
Y3Jvc3MgQ1BVcyB3aG9zZSBwZXJmb3JtYW5jZSBsZXZlbHMgbWF5IGJlCj4gYXBhcnQgYnkgbXVs
dGlwbGUgbGV2ZWxzIG9mIG1hZ25pdHVkZSBkb2Vzbid0IG1ha2Ugd2hvbGUgbG90IG9mIHNlbnNl
Lgo+Cj4gVGhpcyBwYXRjaCBzY2FsZXMgdXAgd3FfY3B1X2ludGVuc2l2ZV90aHJlc2hfdXMgdXB0
byAxIHNlY29uZCB3aGVuIEJvZ29NSVBTCj4gaXMgYmVsb3cgMTAwMC4gVGhpcyBpcyBvYnZpb3Vz
bHkgdmVyeSBpbmFjY3VyYXRlIGJ1dCBpdCBkb2Vzbid0IGhhdmUgdG8gYmUKPiBhY2N1cmF0ZSB0
byBiZSB1c2VmdWwuIFRoZSBtZWNoYW5pc20gaXMgc3RpbGwgdXNlZnVsIHdoZW4gdGhlIHRocmVz
aG9sZCBpcwo+IGZ1bGx5IHNjYWxlZCB1cCBhbmQgdGhlIGJlbmVmaXRzIG9mIHJlcG9ydHMgYXJl
IHVzdWFsbHkgc2hhcmVkIHdpdGggZXZlcnlvbmUKPiByZWdhcmRsZXNzIG9mIHdobydzIHJlcG9y
dGluZywgc28gYXMgbG9uZyBhcyB0aGVyZSBhcmUgc3VmZmljaWVudCBudW1iZXIgb2YKPiBmYXN0
IG1hY2hpbmVzIHJlcG9ydGluZywgd2UgZG9uJ3QgbG9zZSBtdWNoLgo+Cj4gU29tZSAob3IgaXMg
aXQgYWxsPykgQVJNIENQVXMgc3lzdGVtdGljYWxseSByZXBvcnQgc2lnbmlmaWNhbnRseSBsb3dl
cgo+IEJvZ29NSVBTLiBXaGlsZSB0aGlzIGRvZXNuJ3QgYnJlYWsgYW55dGhpbmcsIGdpdmVuIGhv
dyB3aWRlc3ByZWFkIEFSTSBDUFVzCj4gYXJlLCBpdCdzIGF0IGxlYXN0IGEgbWlzc2VkIG9wcG9y
dHVuaXR5IGFuZCBpdCBwcm9iYWJseSB3b3VsZCBiZSBhIGdvb2QgaWRlYQo+IHRvIHRlYWNoIHdv
cmtxdWV1ZSBhYm91dCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRlanVuIEhlbyA8dGpAa2VybmVs
Lm9yZz4KClRoYW5rcyEKCkkgZ2F2ZSBpdCBhIHRyeSBvbiBhIHN5c3RlbSB3aXRoIGFuIDgwMCBN
SHogQ29ydGV4IEE5LCBvbmx5IHRvIGRpc2NvdmVyCml0IG1ha2VzIG5vIGRpZmZlcmVuY2UsIGFz
IHRoYXQgbWFjaGluZSBoYXMgMTYwMCBCb2dvTUlQUzoKCndvcmtxdWV1ZTogZHJtX2ZiX2hlbHBl
cl9kYW1hZ2Vfd29yayBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyA0IHRpbWVzLApjb25zaWRlciBz
d2l0Y2hpbmcgdG8gV1FfVU5CT1VORAp3b3JrcXVldWU6IGRybV9mYl9oZWxwZXJfZGFtYWdlX3dv
cmsgaG9nZ2VkIENQVSBmb3IgPjEwMDAwdXMgOCB0aW1lcywKY29uc2lkZXIgc3dpdGNoaW5nIHRv
IFdRX1VOQk9VTkQKd29ya3F1ZXVlOiBnZW5wZF9wb3dlcl9vZmZfd29ya19mbiBob2dnZWQgQ1BV
IGZvciA+MTAwMDB1cyA0IHRpbWVzLApjb25zaWRlciBzd2l0Y2hpbmcgdG8gV1FfVU5CT1VORAp3
b3JrcXVldWU6IGJsa19tcV9ydW5fd29ya19mbiBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyA0IHRp
bWVzLApjb25zaWRlciBzd2l0Y2hpbmcgdG8gV1FfVU5CT1VORAp3b3JrcXVldWU6IHBtX3J1bnRp
bWVfd29yayBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyA0IHRpbWVzLCBjb25zaWRlcgpzd2l0Y2hp
bmcgdG8gV1FfVU5CT1VORAp3b3JrcXVldWU6IHBoeV9zdGF0ZV9tYWNoaW5lIGhvZ2dlZCBDUFUg
Zm9yID4xMDAwMHVzIDQgdGltZXMsIGNvbnNpZGVyCnN3aXRjaGluZyB0byBXUV9VTkJPVU5ECndv
cmtxdWV1ZTogZHJtX21vZGVfcm1mYl93b3JrX2ZuIGhvZ2dlZCBDUFUgZm9yID4xMDAwMHVzIDQg
dGltZXMsCmNvbnNpZGVyIHN3aXRjaGluZyB0byBXUV9VTkJPVU5ECndvcmtxdWV1ZTogc3luY19o
d19jbG9jayBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyA0IHRpbWVzLCBjb25zaWRlcgpzd2l0Y2hp
bmcgdG8gV1FfVU5CT1VORAp3b3JrcXVldWU6IHJ0Y190aW1lcl9kb193b3JrIGhvZ2dlZCBDUFUg
Zm9yID4xMDAwMHVzIDQgdGltZXMsIGNvbnNpZGVyCnN3aXRjaGluZyB0byBXUV9VTkJPVU5ECgpB
cnRpZmljaWFsbHkgbG93IEJvZ29NSVBTIG51bWJlcnMgb25seSBoYXBwZW4gb24gc3lzdGVtcyB0
aGF0IGhhdmUKdGhlIHJlbGF0ZWQgdGltZXJzIChDb3J0ZXggQTcvQTE1IGFuZCBsYXRlciwgQ29y
dGV4IEE5IE1QQ29yZSwKYW5kIGFybTY0KS4KCkkgd2lsbCB0ZXN0IG9uIG1vcmUgc3lzdGVtcywg
YnV0IHRoYXQgd2lsbCBwcm9iYWJseSBub3QgaGFwcGVuIHVudGlsCm5leHQgd2Vlay4uLgoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
