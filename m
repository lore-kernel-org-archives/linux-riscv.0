Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA96C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dhBuhJweOTnNN+e+1oHNJNLxE1Jrb7ikgp7eVWMVIs=; b=F5T1x9tTOsLabZ
	o+X3uF6ygLQ9tlcdRgyqJ+BkLPgLBGtcKP39k3U9rTXNF9IXST9fDTGYFp2wmETm1gruVrWukckRR
	ZuabaT1q7TdzWoGnzL1jL3agAPwZ2HboicqBeAOO079twMfYZQkB6nmVdjmPzdcJ7XA9nyw+VnD6/
	t76WfP9j0wKCt+Nu/h/46puXqmkmlKgqhOBUE83UJV4HW1MVyEGXnkkzj9mPUTo8vOBeoJ2pOFF7P
	EjXv420UwJDVIWrdRm7q62U7ct8FG5YXFS/T+IDUDnIgKILjBRO6irX92+gi2hhKl5SQzPpWsqmQB
	arwWWEpz59jd1whM3Y8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mplzE-0040j2-4H; Wed, 24 Nov 2021 06:42:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mplzB-0040iU-Ez
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 06:42:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F173760FE3
 for <linux-riscv@lists.infradead.org>; Wed, 24 Nov 2021 06:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637736149;
 bh=EUZz/irRHK/K5cWidrRrSLI5RdyDjoqd/i2pUIYgwxk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sa61kDt/xcJph+Zgh4EZ1Dcutn9HW3EzhO/vhv5IQOuebf3nYMD49T7ESjLcuyesX
 r6OabXx7cICY5Q+P5nc1PSgNpm0X+2MfwRYshlrgp789tn8WGp+nuUbCRdcdx2viqZ
 0fzCuNiGKjlJSSTqPHQMC1KKIwz/s6lZ9/Rl0I5907M3d0fFaBRwvCYZruW+UJkM4/
 qVvbCMfYkJAVhnUB6tuPl+1WAAXzxSLFky5OFJyD4lQqoEnbrs5TcP5IM/lYqzk9lf
 xfZXvbWlH60+onwdKH8sawZCx1bNCIfovhdkY8A0jdXywwOi/2CKlz80DV+Tu9o0no
 7fb7Jg8T8ALyg==
Received: by mail-ua1-f41.google.com with SMTP id y5so2935555ual.7
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 22:42:28 -0800 (PST)
X-Gm-Message-State: AOAM530vQYXfel9UxYPNUdmh/F94EOAxQNPBlOzISZdQbc6OTJhvTfMC
 HrlWnRPMRh46kMlJquNv8sbBzuX6FkuNvMhgwfs=
X-Google-Smtp-Source: ABdhPJygpTPIjs1D0SU6N20VeUeK3Lsie8ae7u5P3VPLnPjeBp6n3aFVYUkYgeHtNDY54LHL3QnDVrRSG9ZreujYxGg=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr6453103uar.66.1637736148026;
 Tue, 23 Nov 2021 22:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <1913356.JkcO0Xq8vV@diego>
In-Reply-To: <1913356.JkcO0Xq8vV@diego>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 24 Nov 2021 14:42:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSwousS4DHWuqprkkckbRa-J=M_a5vSVJ5CiAjDvqGh9w@mail.gmail.com>
Message-ID: <CAJF2gTSwousS4DHWuqprkkckbRa-J=M_a5vSVJ5CiAjDvqGh9w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] riscv: Add riscv.fwsz kernel parameter to save
 memory
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 atishp@rivosinc.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_224229_569252_3BB9A8EF 
X-CRM114-Status: GOOD (  25.68  )
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

T24gV2VkLCBOb3YgMjQsIDIwMjEgYXQgMzozMyBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpIEd1bywKPgo+IEFtIERpZW5zdGFnLCAyMy4gTm92ZW1iZXIg
MjAyMSwgMDI6NTc6MTQgQ0VUIHNjaHJpZWIgZ3VvcmVuQGtlcm5lbC5vcmc6Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhlIGZpcm13YXJlIG9m
IHJpc2N2IChzdWNoIGFzIG9wZW5zYmkpIG9jY3VweSAyTUIoNjRiaXQpIC8KPiA+IDRNQigzMmJp
dCkgaW4gTGludXguIEl0J3MgdmVyeSB3YXN0ZWZ1bCB0byBzbWFsbCBtZW1vcnkgZm9vdHByaW50
Cj4gPiBzb2MgY2hpcCBzdWNoIGFzIEFsbHdpbm5lciBEMXMvRjEzMy4gVGhlIGtlcm5lbCBwYXJh
bWV0ZXIgZ2l2ZXMgYQo+ID4gY2hhbmNlIHRvIHVzZXJzIHRvIHNldCB0aGUgcHJvcGVyIHNpemUg
b2YgdGhlIGZpcm13YXJlIGFuZCBnZXQKPiA+IG1vcmUgdGhhbiAxLjVNQiBvZiBtZW1vcnkuCj4K
PiBpcyB0aGlzIGtlcm5lbCBwYXJhbWV0ZXIgYXBwcm9hY2ggYSByZXN1bHQgb2YgdGhlIFQtSGVh
ZCBJY2UtU29DCj4gY3VycmVudGx5IGxvYWRpbmcgaXRzIG9wZW5TQkkgZnJvbSBpbnNpZGUgdGhl
IG1haW4gdS1ib290IHZpYSBleHRmcy1sb2FkLAo+IGRpcmVjdGx5IGJlZm9yZSB0aGUga2VybmVs
IGl0c2VsZiBbMF0gPwpUaGUgcGF0Y2ggaXMgbm90IHJlbGF0ZWQgdG8gdGhhdCBpc3N1ZS4gVGhl
IHBhdGNoIGp1c3QgaGVscHMgdXNlcnMgd2hvCnB1dCBvcGVuc2JpIGF0IDB+Mk1CIHBhZGRyIHRv
IHNhdmUgbWVtb3J5LgoKPgo+IEJlY2F1c2UgdGhhdCBhcHByb2FjaCBpbiBnZW5lcmFsIGxvb2tz
IG5vdCBpZGVhbC4KPgo+IE5vcm1hbGx5IHlvdSB3YW50IHRoZSBtYWluIHUtYm9vdCBhbHJlYWR5
IHJ1bm5pbmcgd2l0aCBsZXNzIHByaXZpbGVnZXMKPiBzbyBmaXJtd2FyZSBsaWtlIG9wZW5TQkkg
c2hvdWxkJ3ZlIGJlZW4gYWxyZWFkeSBsb2FkZWQgYmVmb3JlIHRoYXQuCj4gRXZlbiBtb3JlIHRy
dWUgd2hlbiB5b3UncmUgZW1wbG95aW5nIG1ldGhvZHMgdG8gcHJvdGVjdCBtZW1vcnkgcmVnaW9u
cwo+IGZyb20gbGVzcyBwcml2aWxlZ2VkIGFjY2Vzcy4KPgo+IEEgbG90IG9mIHNvY3Mgc2V0IHUt
Ym9vdCBhcyBvcGVuc2JpIHBheWxvYWQsIGJ1dCBmb3IgdGhlIGV4YW1wbGUgdGhlIEQxCj4gbWFp
bmxpbmUgYXBwcm9hY2ggdXNlcyB0aGUgQWxsd2lubmVyIFRPQzEgaW1hZ2UgZm9ybWF0IHRvIGxv
YWQgYm90aAo+IG9wZW5zYmkgYW5kIHRoZSBtYWluIHVib290IGludG8gbWVtb3J5IGZyb20gaXRz
IDFzdCBzdGFnZSBsb2FkZXIuCj4KPgo+IE9mIGNvdXJzZSB0aGUgYmVzdCB3YXkgd291bGQgYmUg
dG8ganVzdCBtaW1pYyB3aGF0IGEgbnVtYmVyIG9mCj4gYXJtNjQgYW5kIGFsc28gcmlzY3Ygc29j
cyBkbyBhbmQgdXNlIGFscmVhZHkgZXhpc3RpbmcgdS1ib290IHV0aWxpdGllcy4KPgo+IFUtQm9v
dCBjYW4gY3JlYXRlIGEgRklUIGltYWdlIGNvbnRhaW5pbmcgYm90aCBtYWluIHUtYm9vdCwgZHRi
IGFuZAo+IGZpcm13YXJlIGltYWdlcyB0aGF0IGFsbCBnZXQgbG9hZGVkIGZyb20gU1BMIGFuZCBw
bGFjZWQgYXQgdGhlIGNvcnJlY3QKPiBhZGRyZXNzZXMgYmVmb3JlIGhhdmluZyB0aGUgU1BMIGp1
bXAgaW50byBvcGVuc2JpIGFuZCBmcm9tIHRoZXJlCj4gaW50byB1LWJvb3QgWzFdIC4KPgo+IEFu
ZCBhcyBBbnVwIHdhcyB3cml0aW5nLCByZXNlcnZlZC1tZW1vcnkgc2hvdWxkIHRoZW4gYmUgdGhl
IHdheQo+IHRvIGdvIHRvIHRlbGwgdGhlIGtlcm5lbCB3aGF0IHJlZ2lvbnMgdG8gb21pdC4KPgo+
IEFuZCBtYWlubGluZSB1LWJvb3QgaGFzIGFscmVhZHkgdGhlIG1lYW5zIHRvIGV2ZW4gdGFrZSB0
aGUgcmVzZXJ2ZWQtbWVtb3J5Cj4gZnJvbSB0aGUgZGV2aWNldHJlZSB1c2VkIGJ5IG9wZW5zYmkg
YW5kIGNvcHkgaXQgdG8gYSBuZXcgZGV2aWNldHJlZSwKPiBpZiB0aGUgc2Vjb25kIG9uZSBpcyBk
aWZmZXJlbnQuCj4KPgo+IEhlaWtvCj4KPgo+IFswXSBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFk
LVNlbWkvdS1ib290L2Jsb2IvbWFpbi9pbmNsdWRlL2NvbmZpZ3MvaWNlLWM5MTAuaCNMNDYKPiBb
MV0gc2VlIHNwbF9pbnZva2Vfb3BlbnNiaSgpIGluIGNvbW1vbi9zcGwvc3BsX29wZW5zYmkuYwo+
IFsyXSBzZWUgcmlzY3ZfYm9hcmRfcmVzZXJ2ZWRfbWVtX2ZpeHVwKCkgaW4gYXJjaC9yaXNjdi9s
aWIvZmR0X2ZpeHVwLmMKPgo+ID4KPiA+IEd1byBSZW4gKDMpOgo+ID4gICByaXNjdjogUmVtb3Zl
IDJNQiBvZmZzZXQgaW4gdGhlIG1tIGxheW91dAo+ID4gICByaXNjdjogQWRkIGVhcmx5X3BhcmFt
IHRvIGRlY3JlYXNlIGZpcm13YXJlIHJlZ2lvbgo+ID4gICByaXNjdjogQWRkIHJpc2N2LmZ3c3og
a2VybmVsIHBhcmFtZXRlcgo+ID4KPiA+ICAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0ICAgICAgICAgfCAgMyArKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2Uu
aCAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvaGVh
ZC5TICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrLS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC92bWxpbnV4Lmxkcy5TICAgICAgICAgICAgICAgfCAgNSArKy0tCj4gPiAgYXJjaC9yaXNj
di9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysr
Ky0tLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCj4gPgo+ID4KPgo+Cj4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
