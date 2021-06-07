Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E68DC4743E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 02:17:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C531B610A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 02:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C531B610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW+7hqlTAE9xCY9nojBk7E9DIiqUSB8MSRGdQW3D0W8=; b=b6P2b1PgqYLknSpl23K0aY06Qj
	Ue56uQ8EceJbD4jpJoHGP72YSmfarr0PShvJtpcwR6WBqKLd8YOyppBQXys4xzFIWlstn4o6/jQ77
	tVRtysiF1nQ3YfBnAmaLlQifkyIyBgQppggnVc2+PIKb+H/z3tHjO+k750yh6vm6bYl5S4WK68OF2
	dz5FkT9NNhZavopnF2/nEZtSgpJ16UdJRl9l+Lq6uZVY0FLXvc5mieD0HAT92vvT1ZFv2IQcKdwzP
	5REEkgEtjNrlr/5QvOQw6NGXsiQ8FNNj96lQs5zUEob4b34tuxCXZyrbLd1aftDsdbhrtJkTj1Q8S
	t69V/46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq4or-001Eyy-H5; Mon, 07 Jun 2021 02:16:49 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq4om-001ExR-6j
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 02:16:48 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1572Gfoc061576
 for <linux-riscv@lists.infradead.org>; Mon, 7 Jun 2021 05:16:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623032196; x=1625624196;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+nGwPamCaq87hvoY8I/2It3nzp5ksOheQ6kJN1VYpI=;
 b=g0huyOMuZXFVoaT472uHkr9I43HoImJIsX6gS1eaNwm+W2XryaBiTe0WB5mn+9oY
 E1O9jOv345s67n5dBeknFFDyEa7EQCm9+MkupJg7qghwhE9Y5oxX78VAos0HXB3h
 hACLfl8UirfB5cMWySXD2Qw22YQ/phbxk+GsyU1ZyLUckU+LaOE/1aoDDrfv8Cz4
 xlpeL6ux75qctc1hX5Hx58evx18mQXSqdsfWkh/dpCcXZ7mzYT6Ycway/+NDaQTb
 qvE23idBtkXBfjZlEi2g9S+NVejqW4zTIDuphrgNDFHtow2okQymqMDvHT3mHKg+
 OVE15kXjyE+LNCP9Ni2wmQ==;
X-AuditID: 8b5b014d-962f1700000067b6-83-60bd81842d36
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 08.AB.26550.4818DB06; Mon,  7 Jun 2021 05:16:36 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 05:16:35 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Guo Ren <guoren@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Christoph Hellwig <hch@lst.de>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 =?UTF-8?Q?Wei_Wu_?=
 =?UTF-8?Q?=28=E5=90=B4=E4=BC=9F=29?= <lazyparser@gmail.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Organization: FORTH
In-Reply-To: <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
Message-ID: <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsXSHT1dWbelcW+CwcLLKhZPPkxks7i3Yhm7
 xYu9jSwWxx/tYrFYufook8WlL9dYLDp2fWWxuLxrDpvFts8tbBZT9u1is7j4az6jRfO7c+wW
 WzeuY7Rom8VvMWvxbXaL++vOsVm07J/C4iDo8e73MkaPe2+fMHnsnHWX3WPBplKPh5suMXls
 WtXJ5rHzoaXHr+1HmTw2L6n3eLF5JqPH7psNbB7v911l87jUfJ3d4/MmOY/2A91MAfxRXDYp
 qTmZZalF+nYJXBlrLl5jL9gpVbG54RxbA+NXkS5GDg4JAROJM9vduxi5OIQEjjFKbJ40kamL
 kRMobioxe28nI4jNKyAocXLmExYQm1nAQmLqlf2MELa8RPPW2cwgNouAqsScrc3sIDabgKbE
 /EsHwepFgGp+H+1khaj/zCrR/4AXxBYWsJE4dGU9WJxfQFji092LYDanQKDEufkQ84UENjNL
 bF0sAHGDi8SEqX1sELepSHz4/YAd5H5RIHvzXKUJjIKzkFw6C8mls5BcuoCReRWjQGKZsV5m
 crFeWn5RSYZeetEmRnC8MvruYLy9+a3eIUYmDsZDjBIczEoivF4yexKEeFMSK6tSi/Lji0pz
 UosPMUpzsCiJ8/LqTYgXEkhPLEnNTk0tSC2CyTJxcEo1MNU6JC4RlV5TtspO4USJkvELG0dj
 puVnw0Li/6j9XZ/f2sXy5OKiSpsJO+pY/Cov8TsGCPPus/6kJzdrm7ucN/Ph5rjv7qnn3Z49
 ffXzB19VquSDfS6FszcK7jtX/8SPe/2WzZmfvW67/9u405w3X/2X1i37S2fCPvU1XV56eUpe
 ay9DQVXiVqcfnzctCKlvPO8nVKl7IvrEgietS+4/Mwyabh38QWGrb23V+WS1mFynZSdC+eZm
 zOl9LbPO+Y/3lDmfOPgnSLGl2VyewHTqszB3blqZw9SQLf8MWfrUz6jOkE1duEbdWCbh9L23
 q+osN2u9dL3wVTlgWWhxxbnsefn5q/US8zIalCslGjlilFiKMxINtZiLihMBQ+jQ5EYDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_191644_646130_4915E850 
X-CRM114-Status: GOOD (  30.27  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wNi0wNyAwMzowNCwgR3VvIFJlbiDOrc6zz4HOsc+IzrU6Cj4gT24gTW9u
LCBKdW4gNywgMjAyMSBhdCAyOjE0IEFNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGgu
Z3I+IAo+IHdyb3RlOgo+PiAKPj4gzqPPhM65z4IgMjAyMS0wNS0yMCAwNDo0NSwgR3VvIFJlbiDO
rc6zz4HOsc+IzrU6Cj4+ID4gT24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMjo1MyBQTSBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IE9uIFR1ZSwgTWF5IDE4
LCAyMDIxIGF0IDExOjQ0OjM1UE0gLTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPj4gPj4gPiBU
aGlzIHBhdGNoIHNlcmllcyBsb29rcyBsaWtlIGl0IG1pZ2h0IGJlIHVzZWZ1bCBmb3IgdGhlIFN0
YXJGaXZlIEpINzEwMAo+PiA+PiA+IFsxXSBbMl0gdG9vIGFzIGl0IGhhcyBwZXJpcGhlcmFscyBv
biBhIG5vbi1jb2hlcmVudCBpbnRlcmNvbm5lY3QuIEdNQUMsCj4+ID4+ID4gVVNCIGFuZCBTRElP
IHJlcXVpcmUgdGhhdCB0aGUgTDIgY2FjaGUgbXVzdCBiZSBtYW51YWxseSBmbHVzaGVkIGFmdGVy
Cj4+ID4+ID4gRE1BIG9wZXJhdGlvbnMgaWYgdGhlIGRhdGEgaXMgaW50ZW5kZWQgdG8gYmUgc2hh
cmVkIHdpdGggVTc0IGNvcmVzIFsyXS4KPj4gPj4KPj4gPj4gTm90IHRvbyBtdWNoLCBnaXZlbiB0
aGF0IHRoZSBTaUZpdmUgbGluZWFnZSBDUFVzIGhhdmUgYW4gdW5jYWNoZWQKPj4gPj4gd2luZG93
LCB0aGF0IGlzIGEgdG90YWxseSBkaWZmZXJlbnQgd2F5IHRvIGFsbG9jYXRlIHVuY2FjaGVkIG1l
bW9yeS4KPj4gPiBJdCdzIGEgdmVyeSBiaWcgTUlQUyBzbWVsbC4gV2hhdCdzIHRoZSBhdHRyaWJ1
dGUgb2YgdGhlIHVuY2FjaGVkCj4+ID4gd2luZG93PyAodW5jYWNoZWQgKyBzdHJvbmctb3JkZXIv
IHVuY2FjaGVkICsgd2VhaywgbW9zdCB2ZW5kb3JzIHN0aWxsCj4+ID4gdXNlIEFYSSBpbnRlcmNv
bm5lY3QsIGhvdyB0byBkZWFsIHdpdGggYSBidWZmZXJhYmxlIGF0dHJpYnV0ZT8pIEluCj4+ID4g
ZmFjdCwgY3VzdG9tZXJzJyBkcml2ZXJzIHVzZSBkaWZmZXJlbnQgd2F5cyB0byBkZWFsIHdpdGgg
RE1BIG1lbW9yeSBpbgo+PiA+IG5vbi1jb2hlcmVudCBTT0MuIE1vc3QgcmlzY3YgU09DIHZlbmRv
cnMgYXJlIGZyb20gQVJNLCBzbyBnaXZpbmcgdGhlbQo+PiA+IHRoZSBzYW1lIHdheSBpbiBETUEg
bWVtb3J5IGlzIGEgc21hcnQgY2hvaWNlLiBTbyB1c2luZyBQVEUgYXR0cmlidXRlcwo+PiA+IGlz
IG1vcmUgc3VpdGFibGUuCj4+ID4KPj4gPiBTZWU6Cj4+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3ZpcnR1YWwtbWVtb3J5L2Jsb2IvbWFpbi9zcGVjcy82MTEtdmlydHVhbC1tZW1vcnktZGlm
Zi5wZGYKPj4gPiA0LjQuMQo+PiA+IFRoZSBkcmFmdCBzdXBwb3J0cyBjdXN0b20gYXR0cmlidXRl
IGJpdHMgaW4gUFRFLgo+PiA+Cj4+IAo+PiBOb3Qgb25seSBpdCBkb2Vzbid0IHN1cHBvcnQgY3Vz
dG9tIGF0dHJpYnV0ZXMgb24gUFRFczoKPj4gCj4+ICJCaXRzNjPigJM1NCBhcmUgcmVzZXJ2ZWQg
Zm9yIGZ1dHVyZSBzdGFuZGFyZCB1c2UgYW5kIG11c3QgYmUgemVyb2VkIGJ5Cj4+IHNvZnR3YXJl
IGZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHkuIgo+PiAKPj4gSXQgYWxzbyBnb2VzIGZ1cnRoZXIg
dG8gc2F5IHRoYXQ6Cj4+IAo+PiAiaWYgYW55IG9mIHRoZXNlIGJpdHMgYXJlIHNldCwgYSBwYWdl
LWZhdWx0IGV4Y2VwdGlvbiBpcyByYWlzZWQiCj4gCj4gSW4gUklTQy1WIFZNIFRHLCBBIEMtYml0
IGRpc2N1c3Npb24gaXMgcmFpc2VkLiBTbyBpdCdzIGEgY29tbSBpZGVhIHRvCj4gc3VwcG9ydCBp
dC4KPiAKClRoZSBDLWJpdCB3YXMgcmVjZW50bHkgZHJvcHBlZCwgdGhlcmUgaXMgYSBuZXcgcHJv
cG9zYWwgZm9yIFBhZ2UgQmFzZWQgCk1lbW9yeSBBdHRyaWJ1dGVzIChQQk1UKSB0aGF0IHdlIGNh
biB3b3JrIG9uIC8gcHVzaCBmb3IuCgo+IExldCBMaW51eCBzdXBwb3J0IGN1c3RvbSBQVEUgYXR0
cmlidXRlcyB3b24ndCBnZXQgYW55IHNpZGUgZWZmZWN0IGluIAo+IHByYWN0aWNlLgo+IAo+IElN
TzoKPiBXZSBuZWVkbid0IHdhc3RlIGEgYml0IGluIFBURSwgYnV0IHRoZSBjdXN0b20gaWRlYSBp
biBQVEUgcmVzZXJ2ZWQKPiBiaXRzIGlzIG5lY2Vzc2FyeS4gQmVjYXVzZSBBbGx3aW5uZXIgRDEg
bmVlZHMgY3VzdG9tIFBURSBiaXRzIGluCj4gcmVzZXJ2ZWQgYml0cyB0byB3b3JrIGFyb3VuZC4K
PiBTbyBJIHJlY29tbWVuZCBqdXN0IHJlbW92ZSB0aGUgIkMiIGJpdCBpbiBQVEUsIGJ1dCBhbGxv
dyB2ZW5kb3JzIHRvCj4gZGVmaW5lIHRoZWlyIG93biBQVEUgYXR0cmlidXRlcyBpbiByZXNlcnZl
ZCBiaXRzLiBJJ3ZlIGZvdW5kIGEgd2F5IHRvCj4gY29tcGFjdCBkaWZmZXJlbnQgUFRFIGF0dHJp
YnV0ZXMgb2YgZGlmZmVyZW50IHZlbmRvcnMgZHVyaW5nIHRoZSBMaW51eAo+IGJvb3Qgc3RhZ2Uu
IFRoYXQgbWVhbnMgd2Ugc3RpbGwgY291bGQgdXNlIE9uZSBJbWFnZSBmb3IgYWxsIHZlbmRvcnMg
aW4KPiBMaW51eAoKVGhlIHNwZWMgaXMgY2xlYXIsIHRob3NlIGF0dHJpYnV0ZXMgYXJlIGZvciBz
dGFuZGFyZCB1c2Ugb25seSwgbm90IGZvciAKY3VzdG9tL3BsYXRmb3JtIHVzZS4gSXQncyBvbmUg
dGhpbmcgdG8gaW1wbGVtZW50IGN1c3RvbSBDTU9zIHdoZXJlIHRoZSAKSVNBIGRvZXNuJ3QgaGF2
ZSBhbnl0aGluZyBmb3IgaXQgYW5kIGRvZXNuJ3QgcHJldmVudCB5b3UgdG8gZG8gc28gKHNvIAp5
b3UgYXJlIG5vdCB2aW9sYXRpbmcgYW55dGhpbmcsIGl0J3MganVzdCBhIGN1c3RvbSBleHRlbnNp
b24pLCBhbmQgd2UgCmNhbiBoaWRlIHRoZW0gYmVoaW5kIFNCSSBjYWxscyBldGMsIGFuZCBhbm90
aGVyIHRvIHZpb2xhdGUgdGhlIGN1cnJlbnQgClByaXZpbGVnZSBTcGVjIGJ5IHVzaW5nIGJpdHMg
b24gUFRFcyB0aGF0IGFyZSByZXNlcnZlZCBmb3Igc3RhbmRhcmQgdXNlIApvbmx5LiBUaGUgaW50
ZW50aW9ucyBvZiB0aGUgVk0gVEcgYXJlIGNsZWFyLCBub3Qgb25seSB0aG9zZSBiaXRzIGFyZSAK
cmVzZXJ2ZWQgYnV0IGlmIHNvZnR3YXJlIHVzZXMgdGhlbSB0aGUgaHcgd2lsbCByZXN1bHQgYSBw
YWdlIGZhdWx0IGluIApmdXR1cmUgcmV2aXNpb25zIG9mIHRoZSBzcGVjLiBXaGF0J3MgdGhlIGlk
ZWEgaGVyZSwgdG8gc3VwcG9ydCAKbm9uLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlvbnMgb24gbWFp
bmxpbmUgPyBJJ20gc3VyZSB5b3UgaGF2ZSBhIGdvb2QgCmlkZWEgb24gaG93IHRvIG1ha2UgdGhp
cyB3b3JrLCBidXQgYXMgbG9uZyBhcyBpdCB2aW9sYXRlcyB0aGUgc3BlYyBpdCAKY2FuJ3QgZ28g
aW4gSU1ITy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
