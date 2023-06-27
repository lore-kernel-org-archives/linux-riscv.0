Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC5DEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 09:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyWk8PCq4yUuV3cI5/mKFkGdREE2VzMEvhiDkuGQ7Gg=; b=AXaaQSzZ4wH1Sn
	5Nxr8Iw3mtEMxJUpx3wcqSEXucnmtT3B+aZw1idklbgkqlJu1pKOgP2eVVL/abyq2urzf45fmpxUI
	/FqpDDPHRm+yW3UT/pYNFwFc+M1m8cdlx/iceMaEFXYYTPQ5Xv2zOy8dO7zMXpk3CI1qGcas8ieWl
	FCpoT6EOwoXzsGHGGJ7EA6T3Kvbyj9itVV6mnxRJ+SlxDtvyNiVixJDCx54p2tNJa7FnzOzdz69lA
	XTxYLx7FChsl3SGahBjrTehAMfqX4c1K3xadkMlce5f+S5iZlWb4YBGFw9ww51CRNXwTxRVGqCU6p
	1Ahf4l4Eh9UYBSM24BIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE5LM-00Cj2k-2x;
	Tue, 27 Jun 2023 09:50:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE5LK-00Cj27-0j
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 09:50:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A3536109A
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 09:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DE7C433CC
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687859436;
	bh=GFjEtbcDTN8Gj6F61Z5J4CnRI2yWhEjnhaExEl2QQt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mpvKAggZdcKqUinySEXJb2l8o87xhQH5+AEjcZKuMLX/Ew7ozKVZH8a6z7RIEu9qm
	 OPiVma+XkbALTG59O5dnXT6NxK2ZDyZEavDo3gF0BQllRf29b5SAVUxbq1C84wLjHg
	 hR7ov2m3WfClJNalzdUL38GPeeXiKBTI1ePxJ/+LfJnaUYYUHIJE0PW5w2sQG6raP2
	 9m61CDYZrE1tKADK5cLGy5gaFPFBjnsaD3XhbLCTzgplVZ6+cAfZTqinLn+q5CCwLq
	 Y+NbAfhFLxKEkQV+1Uf5DisI3HM/Ae4qoemlnt0kx15MOvgRRJehZW9t6D0sV/cGRD
	 xX+t4bUT3DHsg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f766777605so5774088e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 02:50:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDyQnED4Tmn5pgF06GrNbeJoTaQem+3pYRprr0lDmcrT0ajcosN/
	8RydJZKKBpb0AMXP3qqAzSM20WYZuW6TnR0kDdc=
X-Google-Smtp-Source: ACHHUZ7HHGQJGU4j426QvpbyJvV5wc5YtrVrrBnwcEfMU/9RDmdooc9pB9TdUeU2Mf+9InL4PWDiJbIGNVh0G5MvEFM=
X-Received: by 2002:a05:6512:6cc:b0:4fb:7675:1ff9 with SMTP id
 u12-20020a05651206cc00b004fb76751ff9mr3473299lff.9.1687859434057; Tue, 27 Jun
 2023 02:50:34 -0700 (PDT)
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
 <CAMj1kXFAsG0nH+2OcG3CBZYqKg=hCRHp8wAmVBFy9vNx6rWgOQ@mail.gmail.com> <CAEEQ3wkT_2GbdsjfA_VA+LeyCzdeQ+Bh+admyVjz7rE3cSWSxA@mail.gmail.com>
In-Reply-To: <CAEEQ3wkT_2GbdsjfA_VA+LeyCzdeQ+Bh+admyVjz7rE3cSWSxA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jun 2023 11:50:22 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGT04HeMqmr7BWYaNQM6jYzYFLGEJY7TNtig-t48n7CLg@mail.gmail.com>
Message-ID: <CAMj1kXGT04HeMqmr7BWYaNQM6jYzYFLGEJY7TNtig-t48n7CLg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] firmware: added a firmware information
 passing method FFI
To: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>
Cc: ron minnich <rminnich@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, rafael@kernel.org, lenb@kernel.org, 
	jdelvare@suse.com, yc.hung@mediatek.com, 
	angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com, 
	pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com, 
	lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org, 
	=?UTF-8?B?6JGb5aOr5bu6?= <geshijian@bytedance.com>, 
	=?UTF-8?B?6Z+m5Lic?= <weidong.wd@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_025038_366411_E064F2C6 
X-CRM114-Status: GOOD (  30.71  )
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

KGNjIFJJU0MtViBtYWludGFpbmVycyBhbmQgbWFpbGluZyBsaXN0KQoKT24gTW9uLCAyNiBKdW4g
MjAyMyBhdCAxMjoyMCwg6L+Q6L6J5bSUIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6
Cj4KPiBIaSBBcmQsIE1hcmssCj4KPiBPbiBNb24sIEp1biAyNiwgMjAyMyBhdCA0OjIz4oCvUE0g
QXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+IERUIHN1cHBvcnQg
Zm9yIFNNQklPUyBjYW4gbGl2ZSBpbiBnZW5lcmljIGNvZGUsIGJ1dCB0aGUgYmluZGluZyBoYXMg
dG8KPiA+IGJlIHNhbmUuIEFzIEkgc3VnZ2VzdGVkIGJlZm9yZSwgaXQgcHJvYmFibHkgbWFrZXMg
c2Vuc2UgdG8gc3VwcGxhbnQKPiA+IHRoZSBlbnRyeXBvaW50IHJhdGhlciB0aGFuIGp1c3QgY2Fy
cnkgaXRzIGFkZHJlc3MgLSB0aGlzIG1lYW5zIGEgJ3JlZycKPiA+IHByb3BlcnR5IHdpdGggYmFz
ZSBhbmQgc2l6ZSB0byBkZXNjcmliZSB0aGUgcGh5c2ljYWwgcmVnaW9uLCBhbmQgYXQKPiA+IGxl
YXN0IG1ham9yL21pbm9yL2RvY3JldiBmaWVsZHMgdG8gZGVzY3JpYmUgdGhlIHZlcnNpb24uCj4K
PiBSZWdhcmRpbmcgZHRzIG5vZGUgYmluZGluZywgb3VyIGN1cnJlbnQgZGVmaW5pdGlvbiBpcyBh
cyBmb2xsb3dzOgo+IC9kdHMKPiB7Cj4gLi4uCj4gY2ZndGFibGVzIHsKPiBhY3BpX3BoeV9wdHIg
PSAwMDAwMDAwMDAwMDAwMDAwOyAvL3U2NAo+IHNtYmlvc19waHlfcHRyID0gMDAwMDAwMDAwMDAw
MDAwMDsgLy91NjQKPiAuLi4KPiB9Cj4gLi4uCj4gfQo+Cj4geDg2IG9ubHkgZ2F2ZSBhIHJvb3Rf
cG9pbnRlciBlbnRyeSBhZGRyZXNzCj4gdTY0IHg4Nl9kZWZhdWx0X2dldF9yb290X3BvaW50ZXIo
dm9pZCkKPiB7Cj4gICAgICAgIHJldHVybiBib290X3BhcmFtcy5hY3BpX3JzZHBfYWRkcjsKPiB9
Cj4KPiBSZWdhcmRpbmcgdGhlIG5hbWluZyBvZiB0aGUgYmluZGluZyBhYm92ZSwgTWFyaywgIGRv
IHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucz8KPgoKSSB3aWxsIGRlZmVyIHRvIE1hcmsgb3Igb3Ro
ZXIgRFQgZXhwZXJ0cyB0byBoZWxwIGRlY2lkZSBvbiB0aGUgbmFtaW5nCmFuZCBnZW5lcmFsIHNo
YXBlIG9mIHRoZXNlLgoKSG93ZXZlciwgYXMgSSBoYXZlIGluZGljYXRlZCB0d2ljZSBub3csIGl0
IHdvdWxkIGJlIGJldHRlciB0byBkZXNjcmliZQp0aGUgU01CSU9TIHN0cnVjdHVyZWQgZGF0YSBk
aXJlY3RseSwgaW5zdGVhZCBvZiBwYXNzaW5nIHRoZSBwaHlzaWNhbAphZGRyZXNzIG9mIG9uZSBv
ZiB0aGUgZXhpc3RpbmcgZW50cnkgcG9pbnRzLiBUaGlzIGF2b2lkcyB0aGUgbmVlZCBmb3IKbWFw
cGluZyBhbmQgcmVzZXJ2aW5nIGFkZGl0aW9uYWwgcGFnZXMgdGhhdCBkb24ndCBjYXJyeSBhbnkg
cmVsZXZhbnQKaW5mb3JtYXRpb24uCgpTbyB0aGUgbm9kZSBpbiBxdWVzdGlvbiBzaG91bGQgaGF2
ZSBhdCBsZWFzdCAoYmFzZSwgc2l6ZSkgYW5kIHRoZQptYWpvciwgbWlub3IgYW5kIGRvY3JldiB2
ZXJzaW9uIGZpZWxkcy4KCj4KPiA+IEZvciB0aGUgQUNQSSBzaWRlLCB5b3Ugc2hvdWxkIGp1c3Qg
aW1wbGVtZW50Cj4gPiBhY3BpX2FyY2hfZ2V0X3Jvb3RfcG9pbnRlcigpIHVuZGVyIGFyY2gvcmlz
Y3YsIGFuZCB3aXJlIGl0IHVwIGluCj4gPiB3aGljaGV2ZXIgd2F5IHlvdSB3YW50LiBCdXQgcGxl
YXNlIGNoZWNrIHdpdGggdGhlIFJJU0MtViBtYWludGFpbmVycwo+ID4gaWYgdGhleSBhcmUgdXAg
Zm9yIHRoaXMsIGFuZCB3aGV0aGVyIHRoZXkgd2FudCB0byBzZWUgdGhpcyBtZWNoYW5pc20KPiA+
IGNvbnRyaWJ1dGVkIHRvIG9uZSBvZiB0aGUgcGVydGluZW50IHNwZWNpZmljYXRpb25zLgo+Cj4g
WW91IHN1Z2dlc3QgcHV0dGluZyBTTUJJT1MgaW4gZ2VuZXJhbCBjb2RlIGluc3RlYWQgb2YgQUNQ
SSwgd2h5PwoKU01CSU9TIGlzIGEgc2VwYXJhdGUgc2V0IG9mIGZpcm13YXJlIHRhYmxlcyB0aGF0
IGhhdmUgbGl0dGxlCnNpZ25pZmljYW5jZSB0byB0aGUga2VybmVsIGl0c2VsZiwgYW5kIGRlc2Ny
aWJpbmcgaXQgdmlhIERUIG1ha2VzCnNlbnNlLgoKQUNQSSBzZXJ2ZXMgYSBzaW1pbGFyIHB1cnBv
c2UgYXMgRFQsIGFuZCBzbyBoYXZpbmcgYm90aCBhdCB0aGUgc2FtZQp0aW1lIHJlc3VsdHMgaW4g
YSBtYWludGVuYW5jZSBidXJkZW4sIHdoZXJlIHRoZSBhcmNoIGNvZGUgaXMgZm9yY2VkIHRvCnJl
YXNvbiBhYm91dCB3aGV0aGVyIHRoZXkgYXJlIGNvbnNpc3RlbnQgd2l0aCBlYWNoIG90aGVyLCBh
bmQgaWYgbm90LAp3aGljaCBkZXNjcmlwdGlvbiBoYXMgcHJlY2VkZW5jZS4KCj4gRnJvbSB0aGUg
cGVyc3BlY3RpdmUgb2YgZmlybXdhcmUgaW5mb3JtYXRpb24gcGFzc2luZywgdGhleSBhcmUgYSBj
bGFzcy4KPgo+IFNNQklPUyBhbmQgQUNQSSBhcmUgbm90IHJlbGF0ZWQgdG8gQVJDSCwgbm9yIGlz
IERUUyB0byBvYnRhaW4gZmlybXdhcmUKPiBpbmZvcm1hdGlvbiwKPgo+IFdoeSBkbyB5b3UgaGF2
ZSB0byBwdXQgcGFydCBvZiB0aGUgQUNQSSBjb2RlIHVuZGVyIGFyY2gvcmlzYy12Lz8KClllcy4g
QW5kIEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlIHVzaW5nIHRoaXMgRkZJIHNjaGVtZSBlaXRo
ZXIuCgpJZiB0aGUgZmlybXdhcmUgdXNlcyBEVCBhcyBhIGNvbmR1aXQgdG8gZGVsaXZlciB0aGUg
QUNQSSBzeXN0ZW0KZGVzY3JpcHRpb24gdG8gdGhlIE9TLCBpdCBpcyBwcm9iYWJseSBiZXR0ZXIg
dG8gcGFzcyB0aGlzIHZpYSB0aGUKL2Nob3NlbiBub2RlIGFzIGEgc3BlY2lhbCBib290IGFyZ3Vt
ZW50LgoKPiBUaGUgc2NvcGUgb2YgdGhlIHByZXZpb3VzIGRpc2N1c3Npb24gd2FzIGxpbWl0ZWQg
dG8gUklTQy1WIGJlY2F1c2Ugb2YKPiBoaXN0b3JpY2FsIHJlYXNvbnMgc3VjaCBhcyB0aGUgYmlu
ZGluZyB3aXRoIEVGSSBvbiBBUk02NC4gV2Ugd2lsbCBvbmx5Cj4gZW5hYmxlIHRoaXMgZnVuY3Rp
b24gb24gUklTQy1WIGluIHN1YnNlcXVlbnQgcGF0Y2hlcy4KPgo+IFRoZSByZWFsaXphdGlvbiBv
ZiB0aGUgRkZJIHNjaGVtZSBpdHNlbGYgaXMgaXJyZWxldmFudCB0byB0aGUgYXJjaC4KPgoKSSBk
b24ndCB0aGluayB3ZSBuZWVkIGEgRkZJIHNjaGVtZSBvciBmcmFtZXdvcmsgZm9yIHRoaXMuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
