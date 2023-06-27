Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B36BEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 12:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6I0tDzqP0dj1DvKpfO7oayBNKrlX2VqIUgyjsv/yEw=; b=JSHXhQmPi3kK03
	vpuma26eogr7lRD6Cm0xQeUXUAwkidjK7liPF1PNrTtFOxWKhqfTYbzpU3gI+maHVtXlYA4WZO5z7
	57D6BKJSvvTSZnXTe4gZZzhzTvvx1aN+ytWePBc48DAR1hDvrOtRkoKtUuLbvQzwJPvGHfg6zx/dc
	/wSCCD79771H5gFa0hlCfAQ8t+g3RfCXZDr4yenwwhaWQIsHw3Ehz8Fhk06s3wEAxOq8b7WVbszkQ
	Hp4GXgC9WMUqvKIRtaf0fXfMcDcOMyRWa59aQ7rOEzlI9x7bwtKuS6UBfjSUq8QJgXPJYdor4q5P3
	HnJy1JrQ8A2AQJgU4O3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE7zW-00DBC8-1c;
	Tue, 27 Jun 2023 12:40:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE7zT-00DB9r-02
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 12:40:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-312824aa384so3954898f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1687869604; x=1690461604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsX4SXg32pBoD8x6wheSWux3YvW6+LLlu5lLGvU4A08=;
        b=NYX4MwTDi6LDbWSS2P+1hTN3MClyVGAhhslCEAPQIKnmlnbe25HJjHhRIRBb+f//w3
         nsQztM7eoHxIWyjwPGDxcj6LrpYH6y4eQomxbFNJf9Js/a58EDwYlrfg+o5z3iFSd59z
         dlHxlGieOEHIow0lzEbjmyEzYo562R+2dcbl60VsU06s8+uF75/daPwM4dSCJ/8TGI5d
         4Xj9xEPxkZFJ08TX/yQTOxg61XdHXSYPYr3HIGlX7E4m9i80/RaucMWtOvk/blq/dF7D
         iK8Gt0LCi6jYQiD60h50H6vu70SuJ+dwOA/RJkux6e0a+jfnzIRp+Rt02YyRzNh+0Qi+
         PWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687869604; x=1690461604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsX4SXg32pBoD8x6wheSWux3YvW6+LLlu5lLGvU4A08=;
        b=K10DTfKRxmvR/hsjDoxx1XyMbQhnKin0pNW4xuV9EhdmG/x3+sTS15aoZ7Li3LqWDu
         elk0YjZsGYS5Atbk78gcZbh3St+0Ie19rtYC34Mopy8WPp/FWalJ9RQIDE9jIpOzW2MY
         XMHmc3JsW2UbkExL0ll2uoczjgsts39qtnmslnY2aM4a6AzAumqQ6zF3OrX0Q3F8plFe
         4hJdbDK4kstfbiQYOoGcoOO+j7eAD5b4Ezeh4G85vhTqqwdNwKu8mSEXv3fz6dMX0cy+
         6GHgXnrNFC10gW4oSM7b+0LnkLFveSj1dcd8yWt2MV1QsvgB4rMmZPq3YG/H4jdecIaG
         GxkA==
X-Gm-Message-State: AC+VfDwV+Ae4qlqkTlKhSuMwoOMyyx9jNt/rzGHwxBdMrsBf9cqUHEVY
	svDPpHLldOSZsoMCOWXSsUC2d23PFMEls6pMZYyuqGq4hQbV5qSiW6uJ5w==
X-Google-Smtp-Source: ACHHUZ78ealNaCFybT1aaDdFLU+JvYWx1kK5RakJszJjSRojkVh7ReDH9O/FAivG5fdaAExlu+rmt39S8z/PbXhiVIw=
X-Received: by 2002:adf:ee51:0:b0:311:1dfb:2907 with SMTP id
 w17-20020adfee51000000b003111dfb2907mr21187428wro.68.1687869604088; Tue, 27
 Jun 2023 05:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230426034001.16-1-cuiyunhui@bytedance.com> <CAMj1kXEKh9O-ndk3QFibJMYfMbG7vm-cLN2vVQM5eDsYK84NzQ@mail.gmail.com>
 <CAEEQ3wkJB5CKm33mHXUOPX5makYOHF8By6FYGnNzRkM-Mo72OQ@mail.gmail.com>
 <ZEj33QLZqEeL+/y4@FVFF77S0Q05N> <CAEEQ3wmDBJkfOeKCQfcnuE+1=1K0D2pzu+Sn+zPEWk+RHs0NFQ@mail.gmail.com>
 <CAP6exY+ydbzh1EkWTFejzwaW+PA-ySVO2Qj+CVJ1XbSMce2S9Q@mail.gmail.com>
 <CAP6exY+tqAU0j1TVEMTzTb18M6_mPH5bWWiAS=94gyDGTY3hyQ@mail.gmail.com>
 <CAEEQ3w=wBdpZWnUd2WWVBC3BtFiUp-PQtNAtdXE4cO4n0XT-fg@mail.gmail.com>
 <CAMj1kXFGpXEPtYpy1+bs13F2P_LLZf9rTMfYMU=6jzgd3=SEcw@mail.gmail.com>
 <CAEEQ3wnbXE0vJnQRLo5MhfDc-Q4PbNWBoWS-oMn71CcJU51JdA@mail.gmail.com>
 <CAMj1kXHfqkU2QxvjTkGBSkEcTf_HirbdOReOJwdpgz3hM8fBHw@mail.gmail.com>
 <CAEEQ3wn2n48TpNQ3MuvrRH4zzg28SaiOswunPeZ01jFm-TbJ5w@mail.gmail.com>
 <CAMj1kXHgaLD43jx0f6hn_j209LGT_4G+w5XEGaYB9znV5p9tdA@mail.gmail.com>
 <CAP6exYJRE8iM63SX3hQP9_5aKYcnN5x0KOAtZOgeEWU5bwLEBA@mail.gmail.com>
 <CAEEQ3wn2zHUZP8gs8ezCczQLdQJqU6MqAgpcG0YeDW2aYTz0TA@mail.gmail.com>
 <CAMj1kXFn7+W=ZGNcSLL6p383SbA8=wstutJ85+qvXzt2G66Seg@mail.gmail.com>
 <CAEEQ3wnXJVBLdqW6GRFuCKuBtr38uKHz7E2+P8TAv1_+b6kBKA@mail.gmail.com>
 <CAMj1kXFAsG0nH+2OcG3CBZYqKg=hCRHp8wAmVBFy9vNx6rWgOQ@mail.gmail.com>
 <CAEEQ3wkT_2GbdsjfA_VA+LeyCzdeQ+Bh+admyVjz7rE3cSWSxA@mail.gmail.com> <CAMj1kXGT04HeMqmr7BWYaNQM6jYzYFLGEJY7TNtig-t48n7CLg@mail.gmail.com>
In-Reply-To: <CAMj1kXGT04HeMqmr7BWYaNQM6jYzYFLGEJY7TNtig-t48n7CLg@mail.gmail.com>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Tue, 27 Jun 2023 20:39:52 +0800
Message-ID: <CAEEQ3wmd4XayKV8BCk+1CZVDXdtCa3vvbhfJyhfkkBccE3fo6w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] firmware: added a firmware information
 passing method FFI
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	ron minnich <rminnich@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, rafael@kernel.org, lenb@kernel.org, 
	jdelvare@suse.com, yc.hung@mediatek.com, 
	angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com, 
	pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com, 
	lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org, 
	=?UTF-8?B?6JGb5aOr5bu6?= <geshijian@bytedance.com>, 
	=?UTF-8?B?6Z+m5Lic?= <weidong.wd@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_054015_409763_92045305 
X-CRM114-Status: GOOD (  18.30  )
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

SGkgQXJkLAoKPgo+IEkgd2lsbCBkZWZlciB0byBNYXJrIG9yIG90aGVyIERUIGV4cGVydHMgdG8g
aGVscCBkZWNpZGUgb24gdGhlIG5hbWluZwo+IGFuZCBnZW5lcmFsIHNoYXBlIG9mIHRoZXNlLgoK
T2theSwgdGhhbmtzLgoKCj4gSG93ZXZlciwgYXMgSSBoYXZlIGluZGljYXRlZCB0d2ljZSBub3cs
IGl0IHdvdWxkIGJlIGJldHRlciB0byBkZXNjcmliZQo+IHRoZSBTTUJJT1Mgc3RydWN0dXJlZCBk
YXRhIGRpcmVjdGx5LCBpbnN0ZWFkIG9mIHBhc3NpbmcgdGhlIHBoeXNpY2FsCj4gYWRkcmVzcyBv
ZiBvbmUgb2YgdGhlIGV4aXN0aW5nIGVudHJ5IHBvaW50cy4gVGhpcyBhdm9pZHMgdGhlIG5lZWQg
Zm9yCj4gbWFwcGluZyBhbmQgcmVzZXJ2aW5nIGFkZGl0aW9uYWwgcGFnZXMgdGhhdCBkb24ndCBj
YXJyeSBhbnkgcmVsZXZhbnQKPiBpbmZvcm1hdGlvbi4KPgo+IFNvIHRoZSBub2RlIGluIHF1ZXN0
aW9uIHNob3VsZCBoYXZlIGF0IGxlYXN0IChiYXNlLCBzaXplKSBhbmQgdGhlCj4gbWFqb3IsIG1p
bm9yIGFuZCBkb2NyZXYgdmVyc2lvbiBmaWVsZHMuCgpPdGhlciBwbGF0Zm9ybXMgYWxzbyBuZWVk
IHJlbGF0ZWQgbWVtb3J5IHRvIHN0b3JlIHRoaXMgdGFibGUsIGRvbid0IHRoZXk/CkNvcmVib290
IGFsc28gY29tcGxldGVzIHRoZSBjb25zdHJ1Y3Rpb24gb2YgdGhpcyB0YWJsZSBhY2NvcmRpbmcg
dG8KaXRzIGV4aXN0aW5nIGNvZGUsIHJhdGhlciB0aGFuIGNyZWF0aW5nIGEgbmV3IGRlc2NyaXB0
aW9uIG1ldGhvZC4KCkZ1cnRoZXJtb3JlLCBBcyB3ZSBkaXNjdXNzZWQgYmVmb3JlLCBTTUJJT1Mt
cmVsYXRlZCBjb2RlIHNob3VsZCBiZQpwbGFjZWQgaW4gdGhlIGdlbmVyYWwgY29kZSwgYW5kIGFu
IGVudHJ5IGFkZHJlc3MgaXMgcmVxdWlyZWQgdG8KY29ubmVjdCB0byBkbWlfc2Nhbl9tYWNoaW5l
KCkuCmFjY29yZGluZyB0byB3aGF0IHlvdSBzYWlkIChiYXNlLCBzaXplLCByZWdpb24pIGhvdyBj
YW4gaXQgYmUKY29ubmVjdGVkIHRvIGRtaV9zY2FuIHdpdGggYW4gZW50cnkgYWRkcmVzcz8KClNv
LCBGb3IgU01CSU9TLCBvbmx5IGtlZXAgdGhlIHNtYmlvcyBwYXJ0IGluIGRyaXZlcnMvZmlybXdh
cmUvZmZpLmMgaW4KdGhpcyBwYXRjaD8gSWYgeWVzIGluIHRlcm1zIG9mIGNvZGUgc3RydWN0dXJl
LCBJIHdpbGwgdXBkYXRlIGl0IGluIHYyLgoKCj4gU01CSU9TIGlzIGEgc2VwYXJhdGUgc2V0IG9m
IGZpcm13YXJlIHRhYmxlcyB0aGF0IGhhdmUgbGl0dGxlCj4gc2lnbmlmaWNhbmNlIHRvIHRoZSBr
ZXJuZWwgaXRzZWxmLCBhbmQgZGVzY3JpYmluZyBpdCB2aWEgRFQgbWFrZXMKPiBzZW5zZS4KPgo+
IEFDUEkgc2VydmVzIGEgc2ltaWxhciBwdXJwb3NlIGFzIERULCBhbmQgc28gaGF2aW5nIGJvdGgg
YXQgdGhlIHNhbWUKPiB0aW1lIHJlc3VsdHMgaW4gYSBtYWludGVuYW5jZSBidXJkZW4sIHdoZXJl
IHRoZSBhcmNoIGNvZGUgaXMgZm9yY2VkIHRvCj4gcmVhc29uIGFib3V0IHdoZXRoZXIgdGhleSBh
cmUgY29uc2lzdGVudCB3aXRoIGVhY2ggb3RoZXIsIGFuZCBpZiBub3QsCj4gd2hpY2ggZGVzY3Jp
cHRpb24gaGFzIHByZWNlZGVuY2UuCj4KCldlbGwuLi4gSSBkb27igJl0IHdhbnQgdG8gZGlzY3Vz
cyB0b28gbXVjaCwgYWNjb3JkaW5nIHRvIHlvdXIKc3VnZ2VzdGlvbiwgVG8gaW1wbGVtZW50IGFj
cGlfYXJjaF9nZXRfcm9vdF9wb2ludGVyKCkgdW5kZXIKYXJjaC9yaXNjdi4KSSdsbCB1cGRhdGUg
aXQgb24gdjIuCgo+IElmIHRoZSBmaXJtd2FyZSB1c2VzIERUIGFzIGEgY29uZHVpdCB0byBkZWxp
dmVyIHRoZSBBQ1BJIHN5c3RlbQo+IGRlc2NyaXB0aW9uIHRvIHRoZSBPUywgaXQgaXMgcHJvYmFi
bHkgYmV0dGVyIHRvIHBhc3MgdGhpcyB2aWEgdGhlCj4gL2Nob3NlbiBub2RlIGFzIGEgc3BlY2lh
bCBib290IGFyZ3VtZW50Lgo+CgpUaGlzIGlzIG5vdCB0aGUgZm9jdXMgb2Ygb3VyIGRpc2N1c3Np
b24gdGhpcyB0aW1lLCBhbmQgd2Ugd2lsbCBkaXNjdXNzCml0IHdoZW4gd2UgZGlzY3VzcyBub2Rl
IG5hbWluZyB3aXRoIERUUyBleHBlcnRzLgoKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
