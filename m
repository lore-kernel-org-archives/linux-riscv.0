Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474B7C4743D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 00:05:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D89B8611AD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 00:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D89B8611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjrFACnB9eDEjXLB6XzqI7BZ8ehAnrC4KO5RorKO398=; b=e7QU4FnwV8oaxI
	PHWOcL9gTzwgTWbb2i/fwPyt/DK9P3ht6zfH8beCucRNVSbv3kfeUN7iHnw/M5qVFLNPSoiPxeU6Y
	5hdzqLrziqAoFq+NiAa2UM2h9FrxgB70rkxxXf2XDklgCp3XIfsh4WtMhSEPULHHXfB2Bv6z5s6uz
	XJK69d26AcWwUiX631Gpicj2oL0LHzD9VfhMPM22UWJDHxjHRgkTFi8Zlwt0ddLro2QOjl32ZjYTY
	JYaWPnwUHz09tgUk0z6xZocB6r8SikYvEYHnn/dZs2lgbT2h0tgocWJw0M8x3vJVnqGNu9PCSuFlM
	gaYI1z12ACS38T+r5Liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq2lE-0014X8-Sx; Mon, 07 Jun 2021 00:04:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq2lB-0014We-QY
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 00:04:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F21461438
 for <linux-riscv@lists.infradead.org>; Mon,  7 Jun 2021 00:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623024293;
 bh=atz/fcsESOx4m+4QdyLdkqW2IvLkfkghNsC8hMHMoCA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KurZTjpisOGAbiz8svMmX6uc4+SaRSwiEJJH43yI/4co87lGcqFgAAS4k6LCPkroD
 lHv1jHyzy7HV08taRk5MiYDAW/mWOr34psAtqjYh53vwxwdXV7PGnZw2mkkizTbvst
 fPOaZgRm/0/tRQcego1vRCK0JWhYbMd0L2sqlr5iKhZbYEKQwbxE0dWlLA8Qo1bOL4
 Rni2BcHIbw53+0fLUm2WOqAFJO8ZqlVVbATNhg+e4pq8fOxApd7kzKAQbaOJ4A06mW
 iSOqOvVTZVOZE1hVm0gdM6256I/ydU8WXp8Txm6QT0h/6BvgKZeAVsiX7OMZ/Cr3mb
 Xhs8u93K9lyLw==
Received: by mail-lf1-f54.google.com with SMTP id i10so23211208lfj.2
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 17:04:53 -0700 (PDT)
X-Gm-Message-State: AOAM533HLWKy5j9rjp/D1qgUa58zsJo9itLrUxVemhri+PiDcwMZIqzb
 eUqtc3g7yXO2J9SuaA9CrpOpZ/4TdmlvVI1vZLg=
X-Google-Smtp-Source: ABdhPJwuQllzav+cgeOOUIngf06MsoU9QTjK26Dvhvo+prT7F1wWL0rZ9xfVmzD2sZ6rrVJ00qzd3egZjVUgtaov0Vw=
X-Received: by 2002:a05:6512:218d:: with SMTP id
 b13mr10221837lft.346.1623024291473; 
 Sun, 06 Jun 2021 17:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
In-Reply-To: <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 08:04:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
Message-ID: <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Christoph Hellwig <hch@lst.de>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>, 
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_170453_916250_3F7E20E9 
X-CRM114-Status: GOOD (  26.54  )
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

T24gTW9uLCBKdW4gNywgMjAyMSBhdCAyOjE0IEFNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3Mu
Zm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAyMS0wNS0yMCAwNDo0NSwgR3VvIFJlbiDO
rc6zz4HOsc+IzrU6Cj4gPiBPbiBXZWQsIE1heSAxOSwgMjAyMSBhdCAyOjUzIFBNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFR1ZSwgTWF5IDE4LCAy
MDIxIGF0IDExOjQ0OjM1UE0gLTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+PiA+IFRoaXMg
cGF0Y2ggc2VyaWVzIGxvb2tzIGxpa2UgaXQgbWlnaHQgYmUgdXNlZnVsIGZvciB0aGUgU3RhckZp
dmUgSkg3MTAwCj4gPj4gPiBbMV0gWzJdIHRvbyBhcyBpdCBoYXMgcGVyaXBoZXJhbHMgb24gYSBu
b24tY29oZXJlbnQgaW50ZXJjb25uZWN0LiBHTUFDLAo+ID4+ID4gVVNCIGFuZCBTRElPIHJlcXVp
cmUgdGhhdCB0aGUgTDIgY2FjaGUgbXVzdCBiZSBtYW51YWxseSBmbHVzaGVkIGFmdGVyCj4gPj4g
PiBETUEgb3BlcmF0aW9ucyBpZiB0aGUgZGF0YSBpcyBpbnRlbmRlZCB0byBiZSBzaGFyZWQgd2l0
aCBVNzQgY29yZXMgWzJdLgo+ID4+Cj4gPj4gTm90IHRvbyBtdWNoLCBnaXZlbiB0aGF0IHRoZSBT
aUZpdmUgbGluZWFnZSBDUFVzIGhhdmUgYW4gdW5jYWNoZWQKPiA+PiB3aW5kb3csIHRoYXQgaXMg
YSB0b3RhbGx5IGRpZmZlcmVudCB3YXkgdG8gYWxsb2NhdGUgdW5jYWNoZWQgbWVtb3J5Lgo+ID4g
SXQncyBhIHZlcnkgYmlnIE1JUFMgc21lbGwuIFdoYXQncyB0aGUgYXR0cmlidXRlIG9mIHRoZSB1
bmNhY2hlZAo+ID4gd2luZG93PyAodW5jYWNoZWQgKyBzdHJvbmctb3JkZXIvIHVuY2FjaGVkICsg
d2VhaywgbW9zdCB2ZW5kb3JzIHN0aWxsCj4gPiB1c2UgQVhJIGludGVyY29ubmVjdCwgaG93IHRv
IGRlYWwgd2l0aCBhIGJ1ZmZlcmFibGUgYXR0cmlidXRlPykgSW4KPiA+IGZhY3QsIGN1c3RvbWVy
cycgZHJpdmVycyB1c2UgZGlmZmVyZW50IHdheXMgdG8gZGVhbCB3aXRoIERNQSBtZW1vcnkgaW4K
PiA+IG5vbi1jb2hlcmVudCBTT0MuIE1vc3QgcmlzY3YgU09DIHZlbmRvcnMgYXJlIGZyb20gQVJN
LCBzbyBnaXZpbmcgdGhlbQo+ID4gdGhlIHNhbWUgd2F5IGluIERNQSBtZW1vcnkgaXMgYSBzbWFy
dCBjaG9pY2UuIFNvIHVzaW5nIFBURSBhdHRyaWJ1dGVzCj4gPiBpcyBtb3JlIHN1aXRhYmxlLgo+
ID4KPiA+IFNlZToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi92aXJ0dWFsLW1lbW9yeS9i
bG9iL21haW4vc3BlY3MvNjExLXZpcnR1YWwtbWVtb3J5LWRpZmYucGRmCj4gPiA0LjQuMQo+ID4g
VGhlIGRyYWZ0IHN1cHBvcnRzIGN1c3RvbSBhdHRyaWJ1dGUgYml0cyBpbiBQVEUuCj4gPgo+Cj4g
Tm90IG9ubHkgaXQgZG9lc24ndCBzdXBwb3J0IGN1c3RvbSBhdHRyaWJ1dGVzIG9uIFBURXM6Cj4K
PiAiQml0czYz4oCTNTQgYXJlIHJlc2VydmVkIGZvciBmdXR1cmUgc3RhbmRhcmQgdXNlIGFuZCBt
dXN0IGJlIHplcm9lZCBieQo+IHNvZnR3YXJlIGZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHkuIgo+
Cj4gSXQgYWxzbyBnb2VzIGZ1cnRoZXIgdG8gc2F5IHRoYXQ6Cj4KPiAiaWYgYW55IG9mIHRoZXNl
IGJpdHMgYXJlIHNldCwgYSBwYWdlLWZhdWx0IGV4Y2VwdGlvbiBpcyByYWlzZWQiCgpJbiBSSVND
LVYgVk0gVEcsIEEgQy1iaXQgZGlzY3Vzc2lvbiBpcyByYWlzZWQuIFNvIGl0J3MgYSBjb21tIGlk
ZWEgdG8Kc3VwcG9ydCBpdC4KCkxldCBMaW51eCBzdXBwb3J0IGN1c3RvbSBQVEUgYXR0cmlidXRl
cyB3b24ndCBnZXQgYW55IHNpZGUgZWZmZWN0IGluIHByYWN0aWNlLgoKSU1POgpXZSBuZWVkbid0
IHdhc3RlIGEgYml0IGluIFBURSwgYnV0IHRoZSBjdXN0b20gaWRlYSBpbiBQVEUgcmVzZXJ2ZWQK
Yml0cyBpcyBuZWNlc3NhcnkuIEJlY2F1c2UgQWxsd2lubmVyIEQxIG5lZWRzIGN1c3RvbSBQVEUg
Yml0cyBpbgpyZXNlcnZlZCBiaXRzIHRvIHdvcmsgYXJvdW5kLgpTbyBJIHJlY29tbWVuZCBqdXN0
IHJlbW92ZSB0aGUgIkMiIGJpdCBpbiBQVEUsIGJ1dCBhbGxvdyB2ZW5kb3JzIHRvCmRlZmluZSB0
aGVpciBvd24gUFRFIGF0dHJpYnV0ZXMgaW4gcmVzZXJ2ZWQgYml0cy4gSSd2ZSBmb3VuZCBhIHdh
eSB0bwpjb21wYWN0IGRpZmZlcmVudCBQVEUgYXR0cmlidXRlcyBvZiBkaWZmZXJlbnQgdmVuZG9y
cyBkdXJpbmcgdGhlIExpbnV4CmJvb3Qgc3RhZ2UuIFRoYXQgbWVhbnMgd2Ugc3RpbGwgY291bGQg
dXNlIE9uZSBJbWFnZSBmb3IgYWxsIHZlbmRvcnMgaW4KTGludXgKCgoKLS0gCkJlc3QgUmVnYXJk
cwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
