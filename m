Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1780AFCE064
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PDr1lDAHS7UsRHHoB8m/z5xk1hRvBx6hTT4YLCp2ro=; b=RJxgMDK3hasQYZ
	LZVdHDe+2P98t11Gfb++ZPw8jbd34ZBJcNNAnT1UzZZwPrYcW87Q1yenlTM6hGLleSVydMYLwmDpc
	XoGTdC5rXFG5rd92sHoOlD9Otug/VVjom7/6XKKyrGa7X0uRcda7qpVqf8hUKequ7u+BauGBjRSnt
	VPw9B4QKjUuLzZVwqQc1Fk+r2RMh/GXymh8YxGwj/jzRu8ph9WZOYBmWBOTRNqAUje6xVfq8UJ0ZO
	MBxjFGeRC/cn8/v+HtwSvJWJ49HSgXz4m3bcq1zYfqjknrg0SEu+OsAODw/Xg612GllqVx0/p7EbP
	n2ZdxtFNXAjMQLjoLW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaaj-000000068BD-3nwl;
	Thu, 26 Feb 2026 12:35:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaah-000000068AN-2mzu
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 12:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 050D141AF0;
	Thu, 26 Feb 2026 12:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31961C116C6;
	Thu, 26 Feb 2026 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772109338;
	bh=+PcqQIDAuZfQS2K22tZ6CDXuGM5fodDeadGgiEtJb3g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Bz6KgPE6aNb8iOkWdUzkidXJGcPpbnr/ZG76+ZwSxtFLJsQpx/XeEy9iYXnpwm+cJ
	 NNrJr8joLK25hDs7/ZzhazMNrh1KlD2SGMUar/NefEnmc39KdyIgYNWxoHZ9pzPlmV
	 bJCwKLhiDzoDFNNRd7UosZrwhKi4ifnOsmAmw3NvYUtX/HeFb2HsN+D/M3DdKbf3sR
	 RhhCmrDRbC7hskhAABnutRcq7rDxpXZ4gsqqB1m1tf32xJU4MoeP7kwkq3QEIeZFu9
	 2Gwex0Jb877h+1m1L6+DmA/DzAx7/XdjfMWAYuinpmquc7t0x+p7sJgoz8Z0gYc7Lv
	 EFHBfTXuBBnFA==
Date: Thu, 26 Feb 2026 12:35:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/2=5D_riscv=3A_Introduce_s?=
 =?US-ASCII?Q?upport_for_hardware_break/watchpoints?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAK9=C2VmEWyPuvGLKhuU+Uew_x2nrj-CMuf_4=5UmNvFMb55qw@mail.gmail.com>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com> <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com> <20260223-mouth-plated-50294c7a6ac0@wendy> <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com> <20260224-likewise-rimless-151f6a12b092@wendy> <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com> <20260225-compress-moody-400a1e2f46fb@spud> <CAAhSdy2WHLahqPMTCqoSff6Z3no8sX2j_g858jp4XW5Et4dJXw@mail.gmail.com> <20260226-shifty-stingily-acfd81c08fde@spud> <CAK9=C2VmEWyPuvGLKhuU+Uew_x2nrj-CMuf_4=5UmNvFMb55qw@mail.gmail.com>
Message-ID: <D6694466-B57D-4B62-8E70-34B09A2B77DD@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_043539_739649_7F282D0B 
X-CRM114-Status: GOOD (  21.79  )
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

CgpPbiAyNiBGZWJydWFyeSAyMDI2IDExOjQwOjUxIEdNVCwgQW51cCBQYXRlbCA8YXBhdGVsQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMjoxNOKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFRodSwgRmVi
IDI2LCAyMDI2IGF0IDExOjA1OjE0QU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4+ID4gT24g
V2VkLCBGZWIgMjUsIDIwMjYgYXQgMjozMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+ID4gPgo+PiA+ID4gT24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMTA6MzM6
MjdBTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPj4gPiA+ID4gT24gVHVlLCBGZWIg
MjQsIDIwMjYgYXQgMTozM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+IHdyb3RlOgo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gT24gVHVlLCBGZWIgMjQsIDIwMjYg
YXQgMDk6MzA6MjRBTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPj4gPiA+ID4gPiA+
IEhpLAo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDM6
NTXigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToK
Pj4gPiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+ID4gT24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgMTA6
MTk6MTdBTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPj4gPiA+Cj4+ID4gPiA+ID4K
Pj4gPiA+ID4gPiBEaWQgeW91IG1pc3MgdGhlIGNvbW1lbnQgYXQgdGhlIGVuZCBhYm91dCB0aGUg
cmVtYWluaW5nIFRPRE9zPwo+PiA+ID4gPgo+PiA+ID4gPiBOby4gQXMgSSBtZW50aW9uZWQgaW4g
dGhlIGNvdmVyIGxldHRlciwgdGhlIHB0cmFjZSBzdXBwb3J0IGlzIG5vdAo+PiA+ID4gPiBpbXBs
ZW1lbnRlZCBoZXJlLiBJIGFtIGFjdGl2ZWx5IHdvcmtpbmcgb24gaXQgYW5kIHRoZXNlIGFyZQo+
PiA+ID4gPiBpbXBsZW1lbnRlZCBpbiBwdHJhY2Ugd29yay4KPj4gPiA+ID4gVGhlIHRlc3QgaXMg
ZG9uZSB1c2luZyB0aGUgcGVyZiBldmVudHMgZGlyZWN0bHkuIFRoZSBzZWNvbmQgcGF0Y2ggaW4K
Pj4gPiA+ID4gdGhpcyBwYXRjaCBzZXQgaGFzIHRoZSB0ZXN0IGFwcGxpY2F0aW9uLgo+PiA+ID4K
Pj4gPiA+IFRoZW4gdGhlIHBhdGNoc2V0IHNob3VsZCBzdGlsbCBiZSBtYXJrZWQgUkZDLCBzaW5j
ZSBpdCBpcyBub3QgZmluaXNoZWQuCj4+ID4KPj4gPiBXb3chIGxldCdzIGFsbCBvZiB1cyBwb3N0
IG9ubHkgbGFyZ2Ugc2VyaWVzIChjb3ZlcmluZyBtdWx0aXBsZSBmZWF0dXJlcykKPj4gPiB3aGlj
aCBhcmUgZGlmZmljdWx0IHRvIHJldmlldyBpbnN0ZWFkIG9mIG1ha2luZyBsaWZlIGVhc2llciBm
b3IgcmV2aWV3ZXJzCj4+ID4gdGhyb3VnaCBpbmNyZW1lbnRhbCBzZXJpZXMgd2hpY2ggbWFrZSBn
cmFkdWFsIHByb2dyZXNzIG92ZXItdGltZS4KPj4KPj4gV2hlcmUgZGlkIEkgc2F5IGRvbid0IHBv
c3QgaXQ/IEluIGZhY3QsIG1hcmtpbmcgaXQgUkZDICpyZXF1aXJlcyoKPj4gcG9zdGluZyBpdC4g
RG9uJ3QgcHV0IHdvcmRzIGluIG15IG1vdXRoLgo+Pgo+Cj5XZWxsLCBJIGRpc2FncmVlIHdpdGgg
eW91IHN1Z2dlc3Rpb24gb2YgbWFya2luZyB0aGlzIHNlcmllcyBhcyBSRkMuCj5UaGlzIHNlcmll
cyBoYXMgd2VsbCBkZWZpbmVkIHNjb3BlIGFuZCBpcyBiYXNlZCBvbiByYXRpZmllZCBzcGVjLgo+
QSBzZXJpZXMgbmVlZCBub3QgY292ZXIgYWxsIHBvc3NpYmxlIGZlYXR1cmVzIHRvIGJlIGEgcmVn
dWxhcgo+bm9uLVJGQyBwYXRjaGVzLgo+Cj5Eb24ndCB0aHJvdyB5b3VyIFJGQyByZWxhdGVkIG9w
aW5pb25zIHBvaW50bGVzc2x5LgoKSXQncyBjbGVhcmx5IG5vdCBwb2ludGxlc3Mgd2hlbiB0aGVy
ZSBhcmUgdW5leHBsYWluZWQgVE9ET3MuClNlZWluZyB0by1kbyBpdGVtcyBpcyBhYnNvbHV0ZWx5
IHN1ZmZpY2llbnQgZ3JvdW5kcyB0byBxdWVzdGlvbiB0aGVtLCBhbmQgd2hlbiB0aGUgcmVzcG9u
c2UgZG9lc24ndCBjbGVhcmx5IGV4cGxhaW4gd2h5IHRoZXkncmUgb2theSwgbXkgdGhvdWdodHMg
YWJvdXQgUkZDIGFyZSByZWFzb25hYmxlIC0gZXZlbiBpZiB1bHRpbWF0ZWx5IHRoZXkgbWlnaHQg
YmUgaW5jb3JyZWN0LgpJbnN0ZWFkIG9mIGJlaW5nIHBhc3NpdmUgYWdncmVzc2l2ZSB3aXRoIG1l
LCB5b3UgY291bGQgaGF2ZSBqdXN0IGV4cGxhaW5lZCB3aHkgaXQgd2FzIG9rYXkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
