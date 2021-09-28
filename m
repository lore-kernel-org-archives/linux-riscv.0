Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D631C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B664E611C7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B664E611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vrull.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjQqT+9pfyaJWzAvnUwY3eSuvvjb7fgrsqIwa5bUwsg=; b=KF5xpRuz5tPrEd
	E278cuLy3gQQ/DJh+sRg5OUETPKRP+h2fqJjduq8CTq8wrL8He4X+Zpl+21kN4aIKbTcUbqDm4a4R
	ntdTojkBQMU4+XoV9QOevfdO1Y+mEMCNWgb3dku6n5ygMcsP+0mAZJtVNdQiRqFvWOqkMynagYKYN
	V/zpCTBVGhOLQym8AFKNDutb1QYURj4OK534e6zGFrt21xG7GR0wGuzaX0Jf4HgxKSuUoa0sm+e1v
	Fz/8oieWPv/cc3syVeuLUJHCaAdebPtPFIGLXhmcTLadWH46ilSp7vUfue9qkiY2TgCSkp+cTIgkq
	CkeKziy6jytTi4hmLXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDRc-007N6t-Py; Tue, 28 Sep 2021 13:46:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDRZ-007N68-Gi
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 13:46:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d26so592412wrb.6
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hMYwlg56M+Uatn8in7lzm9hDiMWb8QWY766EJQqjXt8=;
 b=3oDkN0xNj99wgSCVvL3+63fRcvn211dF1vO+UkFmsxWilZf/0/5RkIuHFdP7CQOGZ3
 Rr6qvizr6O33WeDjIaPBQG2BEdPsk7dFmP9bP+LnCjFjIe+mvEz6wjIerUfplSxe0KZq
 zc+LpEIej68/zv3msxQwBJGuwIxaJkaS/a0+fiw8AWKsW7nWLnID7TCCz/2u5PSS0/1M
 rQ3ZlbEgk1MU+ds0FkuhTcsw5ZXmMVOa6RrrLNYK3btGNmTsZet4VA1BBGpTsZV6yvD9
 UyKqCGQw20NmEOpaFvojWFoJaPwwu21dYjWPrbi1zvfOVusGBNjvmfLb7ndIkd+2PVPz
 H6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hMYwlg56M+Uatn8in7lzm9hDiMWb8QWY766EJQqjXt8=;
 b=x5/1EpF/MzdfnlFNABTyIE17Lx+PWOiisJGJQSU7LOzbbth+aUUJUvsSQ4fVQM2RJG
 kRKaC3gQ2zOQgmkfLijxQiO/BcVIKiahebGL5/NSqa/mJXW/+PUzvRVMCoNSkdCeXD7L
 ClmupNRj3k5Sgaz8oFMNua6Um8MMntVpht84XITl8li4bQi0lcVsxy9y2Hshmclf+mQm
 3a7nTkpkYlHB9eQjI8DaLPA8QvPQpRxBGttLebTYSDA+aw5EkO2wH1Rnu61qVXo7aNxM
 ZtAZXeyugBs15Z9eqpiVDHkL1FAPeQG6hjcvSmP/u7NOywbgnm8UyGntHZtGisMdgRyM
 huAQ==
X-Gm-Message-State: AOAM531+sF90io0NjtObDSwEqn1z1sXkdhEauAhoslJ/bEGVP9S4B4+O
 CP5t32SnU3iIxxE3nAQponkTMuh+ME3GV4MtOQzA7g==
X-Google-Smtp-Source: ABdhPJyLXXG3QFfhqmQbaMtaZf2urVuCmdoxlwYRrnmfrOjcUHh2PAXTLs30Ec3gtLaYjOQyjL5Rt1fX0LW8nc5RwZI=
X-Received: by 2002:a5d:6545:: with SMTP id z5mr127222wrv.90.1632836806783;
 Tue, 28 Sep 2021 06:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
 <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
 <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
 <ad40c335-ee8f-9ff3-4c34-f8fa5ef49e8b@ics.forth.gr>
In-Reply-To: <ad40c335-ee8f-9ff3-4c34-f8fa5ef49e8b@ics.forth.gr>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 28 Sep 2021 15:46:32 +0200
Message-ID: <CAAeLtUBn=WXmp4Ur+7Vg8DgKDVsK8xiiL4ukw_1EDR6tDUoftA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_064649_655515_DA4075C7 
X-CRM114-Status: GOOD (  51.37  )
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

TmljaywKCk9uIFR1ZSwgMjggU2VwdCAyMDIxIGF0IDE1OjE5LCBOaWNrIEtvc3NpZmlkaXMgPG1p
Y2tAaWNzLmZvcnRoLmdyPiB3cm90ZToKPgo+IE9uIDkvMjgvMjEgNzoyNiBBTSwgQXRpc2ggUGF0
cmEgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAyNywgMjAyMSBhdCA4OjUwIFBNIEFudXAgUGF0ZWwg
PGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gVHVlLCBTZXAgMjgsIDIw
MjEgYXQgNjozMiBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiB3cm90ZToK
PiA+Pj4KPiA+Pj4gzqPPhM65z4IgMjAyMS0wOS0yNyAyMzoxMywgQXRpc2ggUGF0cmEgzq3Os8+B
zrHPiM61Ogo+ID4+Pj4+IFdlIG5lZWQgdG8gZGVjaWRlIHdoZXRoZXIgd2Ugc2hvdWxkIHN1cHBv
cnQgdGhlIHVwc3RyZWFtIGtlcm5lbCBmb3IKPiA+Pj4+PiBEMS4gRmV3IHRoaW5ncyB0byBjb25z
aWRlci4KPiA+Pj4+PiDigJMgQ2FuIGl0IGJlIGNvbnNpZGVyZWQgYXMgYW4gZXJyYXRhID8KPiA+
Pj4KPiA+Pj4gSXQncyBvbmUgdGhpbmcgdG8gZm9sbG93IHRoZSBzcGVjIGFuZCBoYXZlIGFuIGVy
cm9yIGluIHRoZQo+ID4+PiBpbXBsZW1lbnRhdGlvbiwgYW5kIGFub3RoZXIgdG8gbm90IGZvbGxv
dyB0aGUgc3BlYy4KPiA+Pj4KPiA+Pj4+PiDigJMgRG9lcyBpdCBzZXQgYSBiYWQgcHJlY2VkZW50
IGFuZCBvcGVuIGNhbiBvZiB3b3JtcyBpbiBmdXR1cmUgPwo+ID4+Pgo+ID4+PiBJTUhPIHllcywg
SSdtIHRoaW5raW5nIG9mIEtlbmRyeXRlIDIxMCBkZXZzIGZvciBleGFtcGxlIGNvbWluZyB1cCBh
bmQKPiA+Pj4gYXNraW5nIGZvciBNTVUgc3VwcG9ydCwgdGhleSAndmUgYWxzbyBzaGlwcGVkIG1h
bnkgY2hpcHMgYWxyZWFkeS4gSSBjYW4KPiA+Pj4gYWxzbyBpbWFnaW5lIG90aGVyIHZlbmRvcnMg
aW4gdGhlIGZ1dHVyZSBjb21pbmcgdXAgd2l0aCBpbXBsZW1lbnRhdGlvbnMKPiA+Pj4gdGhhdCB2
aW9sYXRlIHRoZSBzcGVjIGluIHdoaWNoIGNhc2UgaGFuZGxpbmcgdGhlIHN0YW5kYXJkIHN0dWZm
IHdpbGwKPiA+Pj4gYmVjb21lIG1lc3N5IGFuZCBjb21wbGV4LCBhbmQgaHVydCBwZXJmb3JtYW5j
ZS9zZWN1cml0eS4gV2UnbGwgZW5kIHVwCj4gPj4+IGZpbGxpbmcgdGhlIGNvZGUgd2l0aCBleGNl
cHRpb25zIGFuZCB0d2Vha3MgYWxsIG92ZXIgdGhlIHBsYWNlLiBXZSBuZWVkCj4gPj4+IHRvIGJl
IHN0cmljdCBhYm91dCB3aGF0IGlzICJyaXNjdiIgYW5kIHdoYXQncyAiZHJhZnQgcmlzY3YiIG9y
ICJyaXNjdgo+ID4+PiBpbnNwaXJlZCIsIGFuZCB3aGF0IHdlIGFyZSB3aWxsaW5nIHRvIHN1cHBv
cnQgdXBzdHJlYW0uIEkgY2FuIHVuZGVyc3RhbmQKPiA+Pj4gc3VwcG9ydGluZyB2ZW5kb3IgZXh0
ZW5zaW9ucyB1cHN0cmVhbSBidXQgdGhleSBuZWVkIHRvIGZpdCB3aXRoaW4gdGhlCj4gPj4+IHN0
YW5kYXJkIHNwZWMsIHdlIGNhbid0IGhhdmUgZm9yIGV4YW1wbGUgZXh0ZW5zaW9ucyB0aGF0IHVz
ZSBlbmNvZGluZwo+ID4+PiBzcGFjZS9jc3JzL2ZpZWxkcyBldGMgcmVzZXJ2ZWQgZm9yIHN0YW5k
YXJkIHVzZSwgdGhleSBtYXkgb25seSB1c2UKPiA+Pj4gd2hhdCdzIHJlc2VydmVkIGZvciBjdXN0
b20vdmVuZG9yIHVzZS4gQXQgbGVhc3QgbGV0J3MgYWdyZWUgb24gdGhhdC4KPiA+Pgo+ID4+IFRv
dGFsbHkgYWdyZWUgd2l0aCBOaWNrIGhlcmUuIEl0J3MgYSBzbGlwcGVyeSBzbG9wZS4KPiA+Pgo+
ID4+IEluY2x1ZGluZyBEMSBQVEUgYml0cyAob3IgS2VuZHJ5dGUgSzIxMCBNTVUpIHBhcnQgb2Yg
dGhlIExpbnV4IFJJU0MtVgo+ID4+IG1lYW5zIGZ1dHVyZSBoYXJkd2FyZSB3aGljaCBpbnRlbnRp
b25hbGx5IHZpb2xhdGVzIHNwZWNzIHdpbGwgYWxzbyBoYXZlIHRvCj4gPj4gYmUgbWVyZ2VkIGFu
ZCB0aGUgUklTQy1WIHBhdGNoIGFjY2VwdGFuY2UgcG9saWN5IHdpbGwgaGF2ZSBubyBzaWduaWZp
Y2FuY2UuCj4gPj4KPiA+Pj4KPiA+Pj4+PiDigJMgQ2FuIHdlIGp1c3QgaWdub3JlIEQxIGdpdmVu
IHRoZSBtYXNzIHZvbHVtZSA/Cj4gPj4+Pj4KPiA+Pj4KPiA+Pj4gSU1ITyBubywgd2UgbmVlZCB0
byBmaW5kIGEgd2F5IHRvIHN1cHBvcnQgaXQgdXBzdHJlYW0gYnV0IEkgYmVsaWV2ZQo+ID4+PiB0
aGVyZSBpcyBhbm90aGVyIHF1ZXN0aW9uIHRvIGFuc3dlcjoKPiA+Pj4KPiA+Pj4gRG8gd2UgYWxz
byBndWFyYW50ZWUgIm9uZSBpbWFnZSB0byBydWxlIHRoZW0gYWxsIiBhcHByb2FjaCwgcmVxdWly
ZWQgYnkKPiA+Pj4gYmluYXJ5IGRpc3Ryb3MsIGZvciBpbXBsZW1lbnRhdGlvbnMgdGhhdCB2aW9s
YXRlIHRoZSBzcGVjID8gQXJlIHdlIG9rCj4gPj4+IGZvciBleGFtcGxlIHRvIHN1cHBvcnQgQWxs
d2lubmVyIEQxIHVwc3RyZWFtIGJ1dCByZXF1aXJlIGEgY3VzdG9tCj4gPj4+IGNvbmZpZ3VyYXRp
b24vYnVpbGQgaW5zdGVhZCBvZiBzdXBwb3J0aW5nIGl0IHdpdGggdGhlICJnZW5lcmljIiBpbWFn
ZSA/Cj4gPj4+IEluIG9uZSBjYXNlIHdlIG5lZWQgdG8gaGFuZGxlIHRoZSB2aW9sYXRpb24gYXQg
cnVudGltZSBhbmQgaW50cm9kdWNlCj4gPj4+IG92ZXJoZWFkIGZvciBldmVyeW9uZSAobGlrZSBs
b29raW5nIHVwIF9fcmlzY3Zfc3ZwYm10IGV2ZXJ5IHRpbWUgd2Ugc2V0Cj4gPj4+IGEgUFRFIGlu
IHRoaXMgY2FzZSksIGluIHRoZSBvdGhlciBpdCdzIGFuICNpZmRlZi4KPiA+Pgo+ID4+IEF0IGxl
YXN0LCB3ZSBzaG91bGQgbm90IGhhdmUgaGFyZHdhcmUgdmlvbGF0aW5nIHNwZWNzIGFzIHBhcnQg
b2YgdGhlCj4gPj4gdW5pZmllZCBrZXJuZWwgaW1hZ2UgaW5zdGVhZCBoYXZlIHRoZXNlIGludGVu
dGlvbmFsIGRldmlhdGlvbnMvdmlvbGF0aW9ucwo+ID4+IHVuZGVyIHNlcGFyYXRlIGtjb25maWcg
d2hpY2ggd2lsbCBub3QgYmUgZW5hYmxlZCBieSBkZWZhdWx0LiBUaGlzIG1lYW5zCj4gPj4gdmVu
ZG9ycyAob2Ygc3VjaCBoYXJkd2FyZSkgYW5kIGRpc3Ryb3Mgd2lsbCBoYXZlIHRvIGV4cGxpY2l0
bHkgZW5hYmxlCj4gPj4gc3VwcG9ydCBmb3Igc3VjaCB2aW9sYXRpb25zL2RldmlhdGlvbnMuCj4g
Pj4KPiA+Cj4gPiBJZiB3ZSBtZXJnZSB0aGUgY29kZSBhbmQgYXJlIG5vdCBlbmFibGVkIGJ5IGRl
ZmF1bHQsIGl0IHdvdWxkIGJlIGEKPiA+IG1haW50ZW5hbmNlIG5pZ2h0bWFyZSBpbiBmdXR1cmUu
Cj4gPiBUaGVzZSBwYXJ0IG9mIHRoZSBrZXJuZWwgd2lsbCBub3QgYmUgcmVndWxhcmx5IHRlc3Rl
ZCBidXQgd2UgaGF2ZSB0bwo+ID4gY2FycnkgdGhlIGNoYW5nZXMgZm9yIGEgbG9uZyB0aW1lLgo+
Cj4gSSBkb24ndCBzZWUgYSBkaWZmZXJlbmNlIGJldHdlZW4gaGF2aW5nIHRoZXNlIGZlYXR1cmVz
IGFzIHBhcnQgb2YgdGhlCj4gZ2VuZXJpYyBpbWFnZSB2cyBoYXZpbmcgdGhlbSBhcyBjdXN0b20g
Y29uZmlncy9idWlsZHMuIFRoZSBjb2RlIHdpbGwgZ2V0Cj4gZXhlY3V0ZWQgb25seSBvbiBib2Fy
ZHMgdGhhdCBzdXBwb3J0IHRoZSBjdXN0b20vbm9uLWNvbXBsaWFudAo+IGltcGxlbWVudGF0aW9u
IGFueXdheS4gVG8gdGhlIGNvbnRyYXJ5IHdlJ2xsIGhhdmUgbW9yZSBjb2RlIHRvIHRlc3QgaWYK
PiB3ZSBhcmUgZG9pbmcgdGhpbmdzIGF0IHJ1bnRpbWUgdnMgYXQgY29tcGlsZSB0aW1lLgo+Cj4g
PiBTaW1pbGFyIGNoYW5nZXMgd2lsbCBvbmx5IGdyb3cgb3ZlciB0aW1lIGNhdXNpbmcgYSBsb3Qg
b2YgY3VzdG9tCj4gPiBjb25maWdzIHRoYXQgYXJlIG5vdCBlbmFibGVkIGJ5IGRlZmF1bHQuCj4g
Pgo+Cj4gV2UnbGwgaGF2ZSBhIGxvdCBvZiBjdXN0b20gY29uZmlncyB0aGF0IHdpbGwgb25seSBn
ZXQgdXNlZCBvbiBib2FyZHMKPiB0aGF0IHVzZSB0aGVtLCB2cyBydW50aW1lIGNvZGUgdGhhdCB3
aWxsIHJ1biBmb3Igbm8gcmVhc29uIG9uIGV2ZXJ5Cj4gYm9hcmQgYW5kIGNob29zZSB0aGUgZGVm
YXVsdC9zdGFuZGFyZC1jb21wbGlhbnQgaW1wbGVtZW50YXRpb24gbW9zdCBvZgo+IHRoZSB0aW1l
LiBJbiB0aGUgZW5kIHRoZSBjb2RlIHdpbGwgb25seSBnZXQgdGVzdGVkIG9uIHNwZWNpZmljIGhh
cmR3YXJlCj4gYW55d2F5Lgo+Cj4gPiBJTUhPLCBpZiB3ZSB3YW50IHRvIHN1cHBvcnQgdGhpcyBi
b2FyZCBpbiB1cHN0cmVhbSwgd2Ugc2hvdWxkIGp1c3QKPiA+IGNsZWFybHkgc3RhdGUgdGhhdCBp
dCBpcyBvbmUgdGltZSBzcGVjaWFsIGV4Y2VwdGlvbgo+ID4gZm9yIHRoaXMgYm9hcmQgb25seSBi
ZWNhdXNlIG9mIHRoZSBmb2xsb3dpbmcgcmVhc29ucwo+ID4KPiA+IDEuIFRoZSBib2FyZCBkZXNp
Z24gcHJlZGF0ZXMgdGhlIHBhdGNoIGFjY2VwdGFuY2UgcG9saWN5Lgo+ID4gMi4gV2UgZG9uJ3Qg
aGF2ZSBlbm91Z2ggYWZmb3JkYWJsZSBMaW51eCBjb21wYXRpYmxlIHBsYXRmb3JtcyB0b2RheS4K
PiA+IDMuIEFsbG93aW5nIHJ1bm5pbmcgYW4gdXBzdHJlYW0ga2VybmVsIG9uIEQxIGhlbHBzIHRo
ZSBSSVNDLVYgc29mdHdhcmUKPiA+IGVjb3N5c3RlbSB0byBncm93Lgo+ID4KPgo+IFRoZSBzYW1l
IGNhbiBiZSBzYWlkIGZvciBLZW5kcnl0ZSBhcyB3ZWxsLCBhcmUgd2Ugd2lsbGluZyB0byBhbHNv
Cj4gc3VwcG9ydCB0aGVpciBNTVUgaW1wbGVtZW50YXRpb24gb24gdGhlIGdlbmVyaWMgaW1hZ2Ug
aWYgYSBwYXRjaCBjb21lcwo+IGluPyBUbyBiZSBjbGVhciBJJ20gbm90IHNheWluZyB3ZSBzaG91
bGRuJ3Qgc3VwcG9ydCBEMSBvciBLZW5kcnl0ZQo+IHVwc3RyZWFtLCBJJ20ganVzdCBzYXlpbmcg
dGhhdCB3ZSBzaG91bGRuJ3Qgc2FjcmlmaWNlIHRoZSBjb21wbGV4aXR5IGFuZAo+IHBlcmZvcm1h
bmNlIG9mIHRoZSBjb2RlIHBhdGggZm9yIHN0YW5kYXJkLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlv
bnMsIHRvCj4gc3VwcG9ydCBub24tY29tcGxpYW50IGltcGxlbWVudGF0aW9ucywgYW5kIGluc3Rl
YWQgc3VwcG9ydCBub24tY29tcGxpYW50Cj4gaW1wbGVtZW50YXRpb25zIHdpdGggY3VzdG9tIGtl
cm5lbCBidWlsZHMgdXNpbmcgY29tcGlsZSB0aW1lIG9wdGlvbnMuIEl0CgpGb3IgcHJpbWluZyB0
aGUgcHVtcCBvbiB0aGUgc29mdHdhcmUgZWZmb3J0LCBoYXZpbmcgYSBzb2x1dGlvbiB0aGF0IGlz
IGVuYWJsZWQKb24gZGlzdHJvLWJ1aWxkcyBpcyBjbGVhcmx5IHByZWZlcmFibGUg4oCUIHRoYXQg
bGVhZHMgdG8gdGhlIHNvbHV0aW9uIHRoYXQgUGFsbWVyCmhhZCBvdXRsaW5lZCBhdCBMUEMsIHdo
aWNoIGlzIHRvIGhhdmUgYSBLQ09ORklHIG9wdGlvbiB0aGF0IGVuYWJsZXMgdGhlCmFsdGVybmF0
ZSBjb2RlIHBhdGhzIGFuZCBjYW4gYmUgdHVybmVkIG9mZiBmb3IgZW1iZWRkZWQgdXNlLWNhc2Vz
LgoKPiBzdGlsbCBjb3VudHMgYXMgdXBzdHJlYW0gc3VwcG9ydCwgdGhleSB3b24ndCBoYXZlIHRv
IG1haW50YWluIHRoZWlyIG93bgo+IGZvcmtzLiBJdCdsbCBhbHNvIGFsbG93IGN1c3RvbSBpbXBs
ZW1lbnRhdGlvbnMgdG8gaGF2ZSBtb3JlIGZsZXhpYmlsaXR5Cj4gb24gd2hhdCB0aGV5IGNhbiBk
byBzaW5jZSB0aGV5IHdpbGwgYmUgYWJsZSB0byB1c2UgY29tcGxldGVseQo+IGRpZmZlcmVudC9j
dXN0b20gY29kZSBwYXRocywgaW5zdGVhZCBvZiB0cnlpbmcgdG8gZml0IGluIHRoZSBzdGFuZGFy
ZAo+IGNvZGUgcGF0aCAod2hpY2ggd2lsbCBiZWNvbWUgYSBtZXNzIG92ZXIgdGltZSkuIEkgdGhp
bmsgdGhpcyBhcHByb2FjaCBpcwo+IG11Y2ggbW9yZSBmbGV4aWJsZSBhbmQgd2lsbCBhbGxvdyBt
b3JlIGN1c3RvbWl6YXRpb25zIHRvIGJlIHN1cHBvcnRlZAo+IHVwc3RyZWFtIGluIHRoZSBmdXR1
cmUuCgpUaGUgaW1wb3J0YW50IGRldGFpbCB3aWxsIGJlIHRoZSBncm91bmQgcnVsZXM6IGNoYW5n
ZXMgaGF2ZSB0byBiZSBzdWZmaWNpZW50bHkKcXVhcmFudGluZWQgdGhhdCAoYSkgdGhleSBjYW4g
YmUgdHVybmVkIG9mZiwgKGIpIGNhbiBiZSByZXZlcnRlZCBlYXNpbHkgKGluIGNhc2UKdGhhdCB2
ZW5kb3JzIGZhaWwgdG8gcGVyZm9ybSB0aGVpciBtYWludGVuYW5jZSBvYmxpZ2F0aW9ucyksIGFu
ZCAoYykgdGhleSBkb24ndAphZmZlY3QgdGhlIHBlcmZvcm1hbmNlIGFuZCBjb21wbGV4aXR5IG9m
IHRoZSBzdGFuZGFyZCBjb2RlIHBhdGhzLgoKQ2hlZXJzLApQaGlsaXBwLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
