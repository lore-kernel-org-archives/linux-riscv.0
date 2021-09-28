Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524B1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 14:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA0F6101A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 14:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCA0F6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FuxsyY9e23v3EiGP569Y4fy74hAvn09R1mhK9+7I5+c=; b=RsGE0boUmvz65e
	rpCbxOqeQUNZO9w1OT7HwQZwUxMPRic9CFqmFxFf5u+sW+8O/YWrzScw8pfk0m+BWkQHtuLaHwpRV
	iqNOsAiyB6qlwhg4VO0ToJnmcZ9PBRnYE2mupyU1QxMtAMXEhaB6UigR0RRiS9n8aSKrGJPRK2fp8
	P+r2HEHzorsUC+9QZ8Gnavrf+T5FDr+ckN2CStTX3JZ8uaq5RRJwGtlaQyhiwg9BkulURKEzvZvZW
	lBmqlAssHQzpVa3f3KAmHapG9yY19Ow3bsaao9ha91JmzxC+9UMucxe06llrldLCInALVgsEeKVgI
	8Y3leeeKiK92hBrLla2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVEZl-007hJJ-Jd; Tue, 28 Sep 2021 14:59:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVEZi-007hIb-Ef
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 14:59:20 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2F4E7402F6
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632841154;
 bh=g6a7xv0xqYvnK76VH1tylZcfdtAggOaJwHiB19FiKPk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Y2Y0LLE8HKrzmbyqBYmH8KIZGUmHFUowjI9W6E5mFdUec6CgsXwVOXBhJZXnHb9bo
 abbqFQLfADJ7f0eHLoDU5qtTvMUgtuRyhVQSxFVh5MFjK8xDVtYo42xrhkHuo3n9Kk
 OsRDbPkGUjdlDpUXN3EwyXupi7l+/VQs88f8jwo3JnW9rRL5ka7zEMVmXEZKGxzw+Z
 YyPHP1ba2T44QO2cuFtQwUGWCB3AIWainjvAyEFSjiCVBfpixEotaXAwhwsCTPkm9O
 OuRcL4JtqTUH712brmT0xseQyOwmmADr1hfF0FMEO1K2cHF5uGVDelz4TXTE+Kq/I7
 fXS20Hypqpyzg==
Received: by mail-wr1-f69.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so15221448wrg.17
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 07:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g6a7xv0xqYvnK76VH1tylZcfdtAggOaJwHiB19FiKPk=;
 b=MA5bmuIIPwU6rTEdZ/ATo0pj9J1mrQ+yKBLIbwkHh0dm+Dff7XChW1dnzsEg8236K+
 JqfW39NBHmSXBuktz8321trBV2i4w9cZcNYHfMOtkLM4GzB+axqy81v7NaVF3pg4n66G
 r0T4/cttsUSMMQtsQ8oetXV5rMTDkYbh5DUPaYQZ2z++LF1OgFDW4y07+fkpgWAba84r
 7fCyzVa5r0o/t2ZpkMLNiMo7qS9sqpxb2p+MhGQOLMYojJqKG3LP0TyBg4D2yr2HSBlo
 F8WycxW/moX+QOSj0BfXkiPUyaLZUzyO84/Kj/xYUoOJCtbrYM1Cer0y6qB3ckogToAI
 llCg==
X-Gm-Message-State: AOAM530nwodlwHVNNCftnkiBdcCLo8Xv01OnvsNB2hbFmYn7vlJz0WAQ
 mzW3le4hHtoilyNsPv9zsaPXNlUc0La0B/a5SUJ1iXpQozjiDLOqZ55yffxYAOqdi0utLm4wzZ1
 0EgGjLMSXK0JFYQBqfl3ARiKHoh4p1WDHuFPPa2eq3UPF4WrDkhJWL4PATJ7a5A==
X-Received: by 2002:a17:907:2090:: with SMTP id
 pv16mr6104093ejb.156.1632841142956; 
 Tue, 28 Sep 2021 07:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb7dk2zpfUDJWU60w07G3nZqzH6RPURAItRu5XoTm2AssdQ9aQtejza93BvvpSwe7KzFU5kG1Gdf13XV9bIQQ=
X-Received: by 2002:a17:907:2090:: with SMTP id
 pv16mr6104067ejb.156.1632841142712; 
 Tue, 28 Sep 2021 07:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
 <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
 <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
 <ad40c335-ee8f-9ff3-4c34-f8fa5ef49e8b@ics.forth.gr>
 <CAAeLtUBn=WXmp4Ur+7Vg8DgKDVsK8xiiL4ukw_1EDR6tDUoftA@mail.gmail.com>
In-Reply-To: <CAAeLtUBn=WXmp4Ur+7Vg8DgKDVsK8xiiL4ukw_1EDR6tDUoftA@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 28 Sep 2021 16:58:51 +0200
Message-ID: <CA+zEjCuaxtD8P1CwD25kfNFGFr+nZJt7k+=P8ck5NvLNNgTttw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Taiten Peng <taiten.peng@canonical.com>, 
 Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
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
X-CRM114-CacheID: sfid-20210928_075918_656259_AA2C3363 
X-CRM114-Status: GOOD (  57.73  )
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

T24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMzo0OCBQTSBQaGlsaXBwIFRvbXNpY2gKPHBoaWxpcHAu
dG9tc2ljaEB2cnVsbC5ldT4gd3JvdGU6Cj4KPiBOaWNrLAo+Cj4gT24gVHVlLCAyOCBTZXB0IDIw
MjEgYXQgMTU6MTksIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+
ID4KPiA+IE9uIDkvMjgvMjEgNzoyNiBBTSwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiA+IE9uIE1v
biwgU2VwIDI3LCAyMDIxIGF0IDg6NTAgUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gT24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgNjozMiBBTSBO
aWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiB3cm90ZToKPiA+ID4+Pgo+ID4gPj4+
IM6jz4TOuc+CIDIwMjEtMDktMjcgMjM6MTMsIEF0aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPiA+
ID4+Pj4+IFdlIG5lZWQgdG8gZGVjaWRlIHdoZXRoZXIgd2Ugc2hvdWxkIHN1cHBvcnQgdGhlIHVw
c3RyZWFtIGtlcm5lbCBmb3IKPiA+ID4+Pj4+IEQxLiBGZXcgdGhpbmdzIHRvIGNvbnNpZGVyLgo+
ID4gPj4+Pj4g4oCTIENhbiBpdCBiZSBjb25zaWRlcmVkIGFzIGFuIGVycmF0YSA/Cj4gPiA+Pj4K
PiA+ID4+PiBJdCdzIG9uZSB0aGluZyB0byBmb2xsb3cgdGhlIHNwZWMgYW5kIGhhdmUgYW4gZXJy
b3IgaW4gdGhlCj4gPiA+Pj4gaW1wbGVtZW50YXRpb24sIGFuZCBhbm90aGVyIHRvIG5vdCBmb2xs
b3cgdGhlIHNwZWMuCj4gPiA+Pj4KPiA+ID4+Pj4+IOKAkyBEb2VzIGl0IHNldCBhIGJhZCBwcmVj
ZWRlbnQgYW5kIG9wZW4gY2FuIG9mIHdvcm1zIGluIGZ1dHVyZSA/Cj4gPiA+Pj4KPiA+ID4+PiBJ
TUhPIHllcywgSSdtIHRoaW5raW5nIG9mIEtlbmRyeXRlIDIxMCBkZXZzIGZvciBleGFtcGxlIGNv
bWluZyB1cCBhbmQKPiA+ID4+PiBhc2tpbmcgZm9yIE1NVSBzdXBwb3J0LCB0aGV5ICd2ZSBhbHNv
IHNoaXBwZWQgbWFueSBjaGlwcyBhbHJlYWR5LiBJIGNhbgo+ID4gPj4+IGFsc28gaW1hZ2luZSBv
dGhlciB2ZW5kb3JzIGluIHRoZSBmdXR1cmUgY29taW5nIHVwIHdpdGggaW1wbGVtZW50YXRpb25z
Cj4gPiA+Pj4gdGhhdCB2aW9sYXRlIHRoZSBzcGVjIGluIHdoaWNoIGNhc2UgaGFuZGxpbmcgdGhl
IHN0YW5kYXJkIHN0dWZmIHdpbGwKPiA+ID4+PiBiZWNvbWUgbWVzc3kgYW5kIGNvbXBsZXgsIGFu
ZCBodXJ0IHBlcmZvcm1hbmNlL3NlY3VyaXR5LiBXZSdsbCBlbmQgdXAKPiA+ID4+PiBmaWxsaW5n
IHRoZSBjb2RlIHdpdGggZXhjZXB0aW9ucyBhbmQgdHdlYWtzIGFsbCBvdmVyIHRoZSBwbGFjZS4g
V2UgbmVlZAo+ID4gPj4+IHRvIGJlIHN0cmljdCBhYm91dCB3aGF0IGlzICJyaXNjdiIgYW5kIHdo
YXQncyAiZHJhZnQgcmlzY3YiIG9yICJyaXNjdgo+ID4gPj4+IGluc3BpcmVkIiwgYW5kIHdoYXQg
d2UgYXJlIHdpbGxpbmcgdG8gc3VwcG9ydCB1cHN0cmVhbS4gSSBjYW4gdW5kZXJzdGFuZAo+ID4g
Pj4+IHN1cHBvcnRpbmcgdmVuZG9yIGV4dGVuc2lvbnMgdXBzdHJlYW0gYnV0IHRoZXkgbmVlZCB0
byBmaXQgd2l0aGluIHRoZQo+ID4gPj4+IHN0YW5kYXJkIHNwZWMsIHdlIGNhbid0IGhhdmUgZm9y
IGV4YW1wbGUgZXh0ZW5zaW9ucyB0aGF0IHVzZSBlbmNvZGluZwo+ID4gPj4+IHNwYWNlL2NzcnMv
ZmllbGRzIGV0YyByZXNlcnZlZCBmb3Igc3RhbmRhcmQgdXNlLCB0aGV5IG1heSBvbmx5IHVzZQo+
ID4gPj4+IHdoYXQncyByZXNlcnZlZCBmb3IgY3VzdG9tL3ZlbmRvciB1c2UuIEF0IGxlYXN0IGxl
dCdzIGFncmVlIG9uIHRoYXQuCj4gPiA+Pgo+ID4gPj4gVG90YWxseSBhZ3JlZSB3aXRoIE5pY2sg
aGVyZS4gSXQncyBhIHNsaXBwZXJ5IHNsb3BlLgo+ID4gPj4KPiA+ID4+IEluY2x1ZGluZyBEMSBQ
VEUgYml0cyAob3IgS2VuZHJ5dGUgSzIxMCBNTVUpIHBhcnQgb2YgdGhlIExpbnV4IFJJU0MtVgo+
ID4gPj4gbWVhbnMgZnV0dXJlIGhhcmR3YXJlIHdoaWNoIGludGVudGlvbmFsbHkgdmlvbGF0ZXMg
c3BlY3Mgd2lsbCBhbHNvIGhhdmUgdG8KPiA+ID4+IGJlIG1lcmdlZCBhbmQgdGhlIFJJU0MtViBw
YXRjaCBhY2NlcHRhbmNlIHBvbGljeSB3aWxsIGhhdmUgbm8gc2lnbmlmaWNhbmNlLgo+ID4gPj4K
PiA+ID4+Pgo+ID4gPj4+Pj4g4oCTIENhbiB3ZSBqdXN0IGlnbm9yZSBEMSBnaXZlbiB0aGUgbWFz
cyB2b2x1bWUgPwo+ID4gPj4+Pj4KPiA+ID4+Pgo+ID4gPj4+IElNSE8gbm8sIHdlIG5lZWQgdG8g
ZmluZCBhIHdheSB0byBzdXBwb3J0IGl0IHVwc3RyZWFtIGJ1dCBJIGJlbGlldmUKPiA+ID4+PiB0
aGVyZSBpcyBhbm90aGVyIHF1ZXN0aW9uIHRvIGFuc3dlcjoKPiA+ID4+Pgo+ID4gPj4+IERvIHdl
IGFsc28gZ3VhcmFudGVlICJvbmUgaW1hZ2UgdG8gcnVsZSB0aGVtIGFsbCIgYXBwcm9hY2gsIHJl
cXVpcmVkIGJ5Cj4gPiA+Pj4gYmluYXJ5IGRpc3Ryb3MsIGZvciBpbXBsZW1lbnRhdGlvbnMgdGhh
dCB2aW9sYXRlIHRoZSBzcGVjID8gQXJlIHdlIG9rCj4gPiA+Pj4gZm9yIGV4YW1wbGUgdG8gc3Vw
cG9ydCBBbGx3aW5uZXIgRDEgdXBzdHJlYW0gYnV0IHJlcXVpcmUgYSBjdXN0b20KPiA+ID4+PiBj
b25maWd1cmF0aW9uL2J1aWxkIGluc3RlYWQgb2Ygc3VwcG9ydGluZyBpdCB3aXRoIHRoZSAiZ2Vu
ZXJpYyIgaW1hZ2UgPwo+ID4gPj4+IEluIG9uZSBjYXNlIHdlIG5lZWQgdG8gaGFuZGxlIHRoZSB2
aW9sYXRpb24gYXQgcnVudGltZSBhbmQgaW50cm9kdWNlCj4gPiA+Pj4gb3ZlcmhlYWQgZm9yIGV2
ZXJ5b25lIChsaWtlIGxvb2tpbmcgdXAgX19yaXNjdl9zdnBibXQgZXZlcnkgdGltZSB3ZSBzZXQK
PiA+ID4+PiBhIFBURSBpbiB0aGlzIGNhc2UpLCBpbiB0aGUgb3RoZXIgaXQncyBhbiAjaWZkZWYu
Cj4gPiA+Pgo+ID4gPj4gQXQgbGVhc3QsIHdlIHNob3VsZCBub3QgaGF2ZSBoYXJkd2FyZSB2aW9s
YXRpbmcgc3BlY3MgYXMgcGFydCBvZiB0aGUKPiA+ID4+IHVuaWZpZWQga2VybmVsIGltYWdlIGlu
c3RlYWQgaGF2ZSB0aGVzZSBpbnRlbnRpb25hbCBkZXZpYXRpb25zL3Zpb2xhdGlvbnMKPiA+ID4+
IHVuZGVyIHNlcGFyYXRlIGtjb25maWcgd2hpY2ggd2lsbCBub3QgYmUgZW5hYmxlZCBieSBkZWZh
dWx0LiBUaGlzIG1lYW5zCj4gPiA+PiB2ZW5kb3JzIChvZiBzdWNoIGhhcmR3YXJlKSBhbmQgZGlz
dHJvcyB3aWxsIGhhdmUgdG8gZXhwbGljaXRseSBlbmFibGUKPiA+ID4+IHN1cHBvcnQgZm9yIHN1
Y2ggdmlvbGF0aW9ucy9kZXZpYXRpb25zLgo+ID4gPj4KPiA+ID4KPiA+ID4gSWYgd2UgbWVyZ2Ug
dGhlIGNvZGUgYW5kIGFyZSBub3QgZW5hYmxlZCBieSBkZWZhdWx0LCBpdCB3b3VsZCBiZSBhCj4g
PiA+IG1haW50ZW5hbmNlIG5pZ2h0bWFyZSBpbiBmdXR1cmUuCj4gPiA+IFRoZXNlIHBhcnQgb2Yg
dGhlIGtlcm5lbCB3aWxsIG5vdCBiZSByZWd1bGFybHkgdGVzdGVkIGJ1dCB3ZSBoYXZlIHRvCj4g
PiA+IGNhcnJ5IHRoZSBjaGFuZ2VzIGZvciBhIGxvbmcgdGltZS4KPiA+Cj4gPiBJIGRvbid0IHNl
ZSBhIGRpZmZlcmVuY2UgYmV0d2VlbiBoYXZpbmcgdGhlc2UgZmVhdHVyZXMgYXMgcGFydCBvZiB0
aGUKPiA+IGdlbmVyaWMgaW1hZ2UgdnMgaGF2aW5nIHRoZW0gYXMgY3VzdG9tIGNvbmZpZ3MvYnVp
bGRzLiBUaGUgY29kZSB3aWxsIGdldAo+ID4gZXhlY3V0ZWQgb25seSBvbiBib2FyZHMgdGhhdCBz
dXBwb3J0IHRoZSBjdXN0b20vbm9uLWNvbXBsaWFudAo+ID4gaW1wbGVtZW50YXRpb24gYW55d2F5
LiBUbyB0aGUgY29udHJhcnkgd2UnbGwgaGF2ZSBtb3JlIGNvZGUgdG8gdGVzdCBpZgo+ID4gd2Ug
YXJlIGRvaW5nIHRoaW5ncyBhdCBydW50aW1lIHZzIGF0IGNvbXBpbGUgdGltZS4KPiA+Cj4gPiA+
IFNpbWlsYXIgY2hhbmdlcyB3aWxsIG9ubHkgZ3JvdyBvdmVyIHRpbWUgY2F1c2luZyBhIGxvdCBv
ZiBjdXN0b20KPiA+ID4gY29uZmlncyB0aGF0IGFyZSBub3QgZW5hYmxlZCBieSBkZWZhdWx0Lgo+
ID4gPgo+ID4KPiA+IFdlJ2xsIGhhdmUgYSBsb3Qgb2YgY3VzdG9tIGNvbmZpZ3MgdGhhdCB3aWxs
IG9ubHkgZ2V0IHVzZWQgb24gYm9hcmRzCj4gPiB0aGF0IHVzZSB0aGVtLCB2cyBydW50aW1lIGNv
ZGUgdGhhdCB3aWxsIHJ1biBmb3Igbm8gcmVhc29uIG9uIGV2ZXJ5Cj4gPiBib2FyZCBhbmQgY2hv
b3NlIHRoZSBkZWZhdWx0L3N0YW5kYXJkLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlvbiBtb3N0IG9m
Cj4gPiB0aGUgdGltZS4gSW4gdGhlIGVuZCB0aGUgY29kZSB3aWxsIG9ubHkgZ2V0IHRlc3RlZCBv
biBzcGVjaWZpYyBoYXJkd2FyZQo+ID4gYW55d2F5Lgo+ID4KPiA+ID4gSU1ITywgaWYgd2Ugd2Fu
dCB0byBzdXBwb3J0IHRoaXMgYm9hcmQgaW4gdXBzdHJlYW0sIHdlIHNob3VsZCBqdXN0Cj4gPiA+
IGNsZWFybHkgc3RhdGUgdGhhdCBpdCBpcyBvbmUgdGltZSBzcGVjaWFsIGV4Y2VwdGlvbgo+ID4g
PiBmb3IgdGhpcyBib2FyZCBvbmx5IGJlY2F1c2Ugb2YgdGhlIGZvbGxvd2luZyByZWFzb25zCj4g
PiA+Cj4gPiA+IDEuIFRoZSBib2FyZCBkZXNpZ24gcHJlZGF0ZXMgdGhlIHBhdGNoIGFjY2VwdGFu
Y2UgcG9saWN5Lgo+ID4gPiAyLiBXZSBkb24ndCBoYXZlIGVub3VnaCBhZmZvcmRhYmxlIExpbnV4
IGNvbXBhdGlibGUgcGxhdGZvcm1zIHRvZGF5Lgo+ID4gPiAzLiBBbGxvd2luZyBydW5uaW5nIGFu
IHVwc3RyZWFtIGtlcm5lbCBvbiBEMSBoZWxwcyB0aGUgUklTQy1WIHNvZnR3YXJlCj4gPiA+IGVj
b3N5c3RlbSB0byBncm93Lgo+ID4gPgo+ID4KPiA+IFRoZSBzYW1lIGNhbiBiZSBzYWlkIGZvciBL
ZW5kcnl0ZSBhcyB3ZWxsLCBhcmUgd2Ugd2lsbGluZyB0byBhbHNvCj4gPiBzdXBwb3J0IHRoZWly
IE1NVSBpbXBsZW1lbnRhdGlvbiBvbiB0aGUgZ2VuZXJpYyBpbWFnZSBpZiBhIHBhdGNoIGNvbWVz
Cj4gPiBpbj8gVG8gYmUgY2xlYXIgSSdtIG5vdCBzYXlpbmcgd2Ugc2hvdWxkbid0IHN1cHBvcnQg
RDEgb3IgS2VuZHJ5dGUKPiA+IHVwc3RyZWFtLCBJJ20ganVzdCBzYXlpbmcgdGhhdCB3ZSBzaG91
bGRuJ3Qgc2FjcmlmaWNlIHRoZSBjb21wbGV4aXR5IGFuZAo+ID4gcGVyZm9ybWFuY2Ugb2YgdGhl
IGNvZGUgcGF0aCBmb3Igc3RhbmRhcmQtY29tcGxpYW50IGltcGxlbWVudGF0aW9ucywgdG8KPiA+
IHN1cHBvcnQgbm9uLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlvbnMsIGFuZCBpbnN0ZWFkIHN1cHBv
cnQgbm9uLWNvbXBsaWFudAo+ID4gaW1wbGVtZW50YXRpb25zIHdpdGggY3VzdG9tIGtlcm5lbCBi
dWlsZHMgdXNpbmcgY29tcGlsZSB0aW1lIG9wdGlvbnMuIEl0Cj4KPiBGb3IgcHJpbWluZyB0aGUg
cHVtcCBvbiB0aGUgc29mdHdhcmUgZWZmb3J0LCBoYXZpbmcgYSBzb2x1dGlvbiB0aGF0IGlzIGVu
YWJsZWQKPiBvbiBkaXN0cm8tYnVpbGRzIGlzIGNsZWFybHkgcHJlZmVyYWJsZSDigJQgdGhhdCBs
ZWFkcyB0byB0aGUgc29sdXRpb24gdGhhdCBQYWxtZXIKPiBoYWQgb3V0bGluZWQgYXQgTFBDLCB3
aGljaCBpcyB0byBoYXZlIGEgS0NPTkZJRyBvcHRpb24gdGhhdCBlbmFibGVzIHRoZQo+IGFsdGVy
bmF0ZSBjb2RlIHBhdGhzIGFuZCBjYW4gYmUgdHVybmVkIG9mZiBmb3IgZW1iZWRkZWQgdXNlLWNh
c2VzLgo+Cj4gPiBzdGlsbCBjb3VudHMgYXMgdXBzdHJlYW0gc3VwcG9ydCwgdGhleSB3b24ndCBo
YXZlIHRvIG1haW50YWluIHRoZWlyIG93bgo+ID4gZm9ya3MuIEl0J2xsIGFsc28gYWxsb3cgY3Vz
dG9tIGltcGxlbWVudGF0aW9ucyB0byBoYXZlIG1vcmUgZmxleGliaWxpdHkKPiA+IG9uIHdoYXQg
dGhleSBjYW4gZG8gc2luY2UgdGhleSB3aWxsIGJlIGFibGUgdG8gdXNlIGNvbXBsZXRlbHkKPiA+
IGRpZmZlcmVudC9jdXN0b20gY29kZSBwYXRocywgaW5zdGVhZCBvZiB0cnlpbmcgdG8gZml0IGlu
IHRoZSBzdGFuZGFyZAo+ID4gY29kZSBwYXRoICh3aGljaCB3aWxsIGJlY29tZSBhIG1lc3Mgb3Zl
ciB0aW1lKS4gSSB0aGluayB0aGlzIGFwcHJvYWNoIGlzCj4gPiBtdWNoIG1vcmUgZmxleGlibGUg
YW5kIHdpbGwgYWxsb3cgbW9yZSBjdXN0b21pemF0aW9ucyB0byBiZSBzdXBwb3J0ZWQKPiA+IHVw
c3RyZWFtIGluIHRoZSBmdXR1cmUuCj4KPiBUaGUgaW1wb3J0YW50IGRldGFpbCB3aWxsIGJlIHRo
ZSBncm91bmQgcnVsZXM6IGNoYW5nZXMgaGF2ZSB0byBiZSBzdWZmaWNpZW50bHkKPiBxdWFyYW50
aW5lZCB0aGF0IChhKSB0aGV5IGNhbiBiZSB0dXJuZWQgb2ZmLCAoYikgY2FuIGJlIHJldmVydGVk
IGVhc2lseSAoaW4gY2FzZQo+IHRoYXQgdmVuZG9ycyBmYWlsIHRvIHBlcmZvcm0gdGhlaXIgbWFp
bnRlbmFuY2Ugb2JsaWdhdGlvbnMpLAoKQ2FuIHdlIHJlYWxseSByZW1vdmUgc3VwcG9ydCBvbmNl
IGl0IGlzIGluIGFuZCB3aWRlbHkgdXNlZD8KCj4gYW5kIChjKSB0aGV5IGRvbid0Cj4gYWZmZWN0
IHRoZSBwZXJmb3JtYW5jZSBhbmQgY29tcGxleGl0eSBvZiB0aGUgc3RhbmRhcmQgY29kZSBwYXRo
cy4KPgo+IENoZWVycywKPiBQaGlsaXBwLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
