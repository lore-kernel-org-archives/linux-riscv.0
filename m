Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4BDC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 06:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfBtZ5S1PjaAyiiK0C8zxSOF2HindITs7iCWeR1BW0U=; b=rwBSKWDQMZLx85
	vOdjFbDT+l0TvMMEamSv/Gq4xZ70rdGUzLyHa88eVSM7f8LsOxsYrQTpBgKy0BJWJuZtTBeXZTVro
	OnGy+vmEh9HnCEfjGrRq73D5wt29avDYm60NDVCLDtT/XJltByN9J4ZRY4MBnPN7juiu+WhYqlDrr
	2ttiBQ4DwVi+MxkPbZ/Rn7oOFfKxRMSZZXit+rQzqE4sNqT+pKkd+wvBHj7MQb46ana819tei+M53
	FX4M1+eAaxW+D3/onRcngE+ag2Ow8iRCdPEvWRhuDenzO7q6CqxJ7I5neJ02hRzLxEivxZzAEfJm5
	/xppwTlOD+K03RJfEBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpm69-0041Rf-0w; Wed, 24 Nov 2021 06:49:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpm66-0041Qq-PM
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 06:49:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28BAC60FBF
 for <linux-riscv@lists.infradead.org>; Wed, 24 Nov 2021 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637736578;
 bh=Ebcw5RundFBpl8/xrGQfFKAmVAYDZlcyTj6seHP0/04=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CLTlJ/6eLy9WR3MM7Rh7Rxq7KIgTY0n18ugDU1PqxzOX5b0gIbXMoi8wDYElHWxKP
 9TJKjbY3aCgAxk3mMlhyL2g/iNIessGut8CNajnrJ/65jZ7yBDbcSL/PkckwzuwyeL
 S/neydtIpBNE0sMA/xoxwhQoxO4JKd4LYeHCRiNpWhpQKJ2vGevLHEdKQh5c6JAkvE
 l/Q6XebNOqM0/aUV9XZYb1aTMHwrSptncPbeb2gbFzYD2t3BBOq08L+h6GA/P9HZph
 JOD+ZyXwEMY51wY6BB6kswz0OExfK94++He2bLFBd4TyzSMP17oIr1ngcbfbKgz6FS
 775y/YDRoNHGQ==
Received: by mail-ua1-f48.google.com with SMTP id r15so3013202uao.3
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 22:49:38 -0800 (PST)
X-Gm-Message-State: AOAM533SuXDiR4B2emi545mBI5oN1knUqet8V6aUBnpi9I+2OxxRFb1U
 o8LgpjNEUqr1gbpQSITO/rLgJ+mCvvvq+UaRQ10=
X-Google-Smtp-Source: ABdhPJygth1IGuwaFZgZO0p+p4TD2LPWUK8dsPPSI+Kuc0gZwg7fzZv9JR35/p2I5qVJ1zJnh3ZoPUsE0dyb8dJqiek=
X-Received: by 2002:a05:6102:3a11:: with SMTP id
 b17mr19909721vsu.28.1637736577183; 
 Tue, 23 Nov 2021 22:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <1913356.JkcO0Xq8vV@diego>
 <CAOnJCU+-WCHA9vgrbcMFsLMaimwJNEXOpqMLS_0Gq_JRM5QNWQ@mail.gmail.com>
In-Reply-To: <CAOnJCU+-WCHA9vgrbcMFsLMaimwJNEXOpqMLS_0Gq_JRM5QNWQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 24 Nov 2021 14:49:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQAypx=5+a84zZpj7ofs-aPpPMNZyaB+HEgD8Dfyt6TiA@mail.gmail.com>
Message-ID: <CAJF2gTQAypx=5+a84zZpj7ofs-aPpPMNZyaB+HEgD8Dfyt6TiA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] riscv: Add riscv.fwsz kernel parameter to save
 memory
To: Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 atishp@rivosinc.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_224938_893593_557972B4 
X-CRM114-Status: GOOD (  34.13  )
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

T24gV2VkLCBOb3YgMjQsIDIwMjEgYXQgNDowMSBBTSBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNo
cGF0cmEub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDIzLCAyMDIxIGF0IDExOjMzIEFNIEhl
aWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4KPiA+IEhpIEd1bywKPiA+
Cj4gPiBBbSBEaWVuc3RhZywgMjMuIE5vdmVtYmVyIDIwMjEsIDAyOjU3OjE0IENFVCBzY2hyaWVi
IGd1b3JlbkBrZXJuZWwub3JnOgo+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxp
YmFiYS5jb20+Cj4gPiA+Cj4gPiA+IFRoZSBmaXJtd2FyZSBvZiByaXNjdiAoc3VjaCBhcyBvcGVu
c2JpKSBvY2N1cHkgMk1CKDY0Yml0KSAvCj4gPiA+IDRNQigzMmJpdCkgaW4gTGludXguIEl0J3Mg
dmVyeSB3YXN0ZWZ1bCB0byBzbWFsbCBtZW1vcnkgZm9vdHByaW50Cj4gPiA+IHNvYyBjaGlwIHN1
Y2ggYXMgQWxsd2lubmVyIEQxcy9GMTMzLiBUaGUga2VybmVsIHBhcmFtZXRlciBnaXZlcyBhCj4g
PiA+IGNoYW5jZSB0byB1c2VycyB0byBzZXQgdGhlIHByb3BlciBzaXplIG9mIHRoZSBmaXJtd2Fy
ZSBhbmQgZ2V0Cj4gPiA+IG1vcmUgdGhhbiAxLjVNQiBvZiBtZW1vcnkuCj4gPgo+ID4gaXMgdGhp
cyBrZXJuZWwgcGFyYW1ldGVyIGFwcHJvYWNoIGEgcmVzdWx0IG9mIHRoZSBULUhlYWQgSWNlLVNv
Qwo+ID4gY3VycmVudGx5IGxvYWRpbmcgaXRzIG9wZW5TQkkgZnJvbSBpbnNpZGUgdGhlIG1haW4g
dS1ib290IHZpYSBleHRmcy1sb2FkLAo+ID4gZGlyZWN0bHkgYmVmb3JlIHRoZSBrZXJuZWwgaXRz
ZWxmIFswXSA/Cj4KPiBMb29raW5nIGF0IHRoZSBkZWZjb25maWdbMV0sIGl0IG1heSBiZSBVLUJv
b3QgU1BMIG5vdCBVLUJvb3QgcHJvcGVyLiBJCj4gbWF5IGJlIGxvb2tpbmcgYXQgdGhlIHdyb25n
IGNvbmZpZyB0aG91Z2guCj4gSWYgVS1Cb290IFNQTCBpcyBhY3R1YWxseSB1c2VkLCB5b3UgZG9u
J3QgZXZlbiBuZWVkIHRvIG1hbnVhbGx5IGxvYWQKPiBPcGVuU0JJICJmd19qdW1wIiBiaW5hcnku
Cj4KPiBBcyBIZWlrbyBwb2ludGVkLCB5b3Ugc2hvdWxkIGp1c3QgZm9sbG93IGhvdyBVLUJvb3Qg
U1BMIHdvcmtzIG9uCj4gaGlmaXZlIHVubWF0Y2hlZCAoY3JlYXRpbmcgdGhlIEZJVCBpbWFnZSkK
PiBUaGUgc3RhbmRhcmQgVS1Cb290IFNQTCB1c2VzIHdpdGggZndfZHluYW1pYyB3aGljaCBwcm92
aWRlcyBhbGwgdGhlCj4gZmxleGliaWxpdHkgeW91IHdhbnQuCkkndmUgbm8gcmlnaHQgdG8gZm9y
Y2UgdXNlcnMnIGZsYXZvciBvZiBib290IGZsb3cuCgoxKSBTUEwgLT4gb3BlbnNiaSBNLW1vZGUg
LT4gdS1ib290IFMtbW9kZSAtPiBMaW51eAoyKSBTUEwgLT4gdS1ib290IE0tbW9kZSAtPiBvcGVu
c2JpIE0tbW9kZSAtPiBMaW51eAoKQWxsIGFyZSBva2F5IGZvciBtZS4gSSB0aGluayB0aGUgbW9z
dCBzdHJhaWdodGZvcndhcmQgcmVhc29uIGZvcgpwZW9wbGUgY2hvb3NpbmcgMikgaXMgdGhhdCB0
aGV5IHdhbnQgdG8gdHJ5IHRoZSBuZXdlc3QgT3BlblNCSSAmIExpbnV4CmFuZCAyKSBpcyBtb3Jl
IGNvbnZlbmllbnQgZm9yIHJlcGxhY2luZy4KCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL1Qt
aGVhZC1TZW1pL3UtYm9vdC9ibG9iL21haW4vY29uZmlncy9pY2VfZXZiX2M5MTBfZGVmY29uZmln
Cj4gPgo+ID4gQmVjYXVzZSB0aGF0IGFwcHJvYWNoIGluIGdlbmVyYWwgbG9va3Mgbm90IGlkZWFs
Lgo+ID4KPiA+IE5vcm1hbGx5IHlvdSB3YW50IHRoZSBtYWluIHUtYm9vdCBhbHJlYWR5IHJ1bm5p
bmcgd2l0aCBsZXNzIHByaXZpbGVnZXMKPiA+IHNvIGZpcm13YXJlIGxpa2Ugb3BlblNCSSBzaG91
bGQndmUgYmVlbiBhbHJlYWR5IGxvYWRlZCBiZWZvcmUgdGhhdC4KPiA+IEV2ZW4gbW9yZSB0cnVl
IHdoZW4geW91J3JlIGVtcGxveWluZyBtZXRob2RzIHRvIHByb3RlY3QgbWVtb3J5IHJlZ2lvbnMK
PiA+IGZyb20gbGVzcyBwcml2aWxlZ2VkIGFjY2Vzcy4KPiA+Cj4gPiBBIGxvdCBvZiBzb2NzIHNl
dCB1LWJvb3QgYXMgb3BlbnNiaSBwYXlsb2FkLCBidXQgZm9yIHRoZSBleGFtcGxlIHRoZSBEMQo+
ID4gbWFpbmxpbmUgYXBwcm9hY2ggdXNlcyB0aGUgQWxsd2lubmVyIFRPQzEgaW1hZ2UgZm9ybWF0
IHRvIGxvYWQgYm90aAo+ID4gb3BlbnNiaSBhbmQgdGhlIG1haW4gdWJvb3QgaW50byBtZW1vcnkg
ZnJvbSBpdHMgMXN0IHN0YWdlIGxvYWRlci4KPiA+Cj4gPgo+ID4gT2YgY291cnNlIHRoZSBiZXN0
IHdheSB3b3VsZCBiZSB0byBqdXN0IG1pbWljIHdoYXQgYSBudW1iZXIgb2YKPiA+IGFybTY0IGFu
ZCBhbHNvIHJpc2N2IHNvY3MgZG8gYW5kIHVzZSBhbHJlYWR5IGV4aXN0aW5nIHUtYm9vdCB1dGls
aXRpZXMuCj4gPgo+ID4gVS1Cb290IGNhbiBjcmVhdGUgYSBGSVQgaW1hZ2UgY29udGFpbmluZyBi
b3RoIG1haW4gdS1ib290LCBkdGIgYW5kCj4gPiBmaXJtd2FyZSBpbWFnZXMgdGhhdCBhbGwgZ2V0
IGxvYWRlZCBmcm9tIFNQTCBhbmQgcGxhY2VkIGF0IHRoZSBjb3JyZWN0Cj4gPiBhZGRyZXNzZXMg
YmVmb3JlIGhhdmluZyB0aGUgU1BMIGp1bXAgaW50byBvcGVuc2JpIGFuZCBmcm9tIHRoZXJlCj4g
PiBpbnRvIHUtYm9vdCBbMV0gLgo+ID4KPiA+IEFuZCBhcyBBbnVwIHdhcyB3cml0aW5nLCByZXNl
cnZlZC1tZW1vcnkgc2hvdWxkIHRoZW4gYmUgdGhlIHdheQo+ID4gdG8gZ28gdG8gdGVsbCB0aGUg
a2VybmVsIHdoYXQgcmVnaW9ucyB0byBvbWl0Lgo+ID4KPiA+IEFuZCBtYWlubGluZSB1LWJvb3Qg
aGFzIGFscmVhZHkgdGhlIG1lYW5zIHRvIGV2ZW4gdGFrZSB0aGUgcmVzZXJ2ZWQtbWVtb3J5Cj4g
PiBmcm9tIHRoZSBkZXZpY2V0cmVlIHVzZWQgYnkgb3BlbnNiaSBhbmQgY29weSBpdCB0byBhIG5l
dyBkZXZpY2V0cmVlLAo+ID4gaWYgdGhlIHNlY29uZCBvbmUgaXMgZGlmZmVyZW50Lgo+ID4KPiA+
Cj4gPiBIZWlrbwo+ID4KPiA+Cj4gPiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1p
L3UtYm9vdC9ibG9iL21haW4vaW5jbHVkZS9jb25maWdzL2ljZS1jOTEwLmgjTDQ2Cj4gPiBbMV0g
c2VlIHNwbF9pbnZva2Vfb3BlbnNiaSgpIGluIGNvbW1vbi9zcGwvc3BsX29wZW5zYmkuYwo+ID4g
WzJdIHNlZSByaXNjdl9ib2FyZF9yZXNlcnZlZF9tZW1fZml4dXAoKSBpbiBhcmNoL3Jpc2N2L2xp
Yi9mZHRfZml4dXAuYwo+ID4KPiA+ID4KPiA+ID4gR3VvIFJlbiAoMyk6Cj4gPiA+ICAgcmlzY3Y6
IFJlbW92ZSAyTUIgb2Zmc2V0IGluIHRoZSBtbSBsYXlvdXQKPiA+ID4gICByaXNjdjogQWRkIGVh
cmx5X3BhcmFtIHRvIGRlY3JlYXNlIGZpcm13YXJlIHJlZ2lvbgo+ID4gPiAgIHJpc2N2OiBBZGQg
cmlzY3YuZndzeiBrZXJuZWwgcGFyYW1ldGVyCj4gPiA+Cj4gPiA+ICAuLi4vYWRtaW4tZ3VpZGUv
a2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAgICAgfCAgMyArKysKPiA+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGFnZS5oICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysKPiA+ID4gIGFy
Y2gvcmlzY3Yva2VybmVsL2hlYWQuUyAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKy0tLS0t
Cj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAgICAgICAgICAgICAgfCAg
NSArKy0tCj4gPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyMyArKysrKysrKysrKysrKysrLS0tCj4gPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPgo+ID4KPiA+Cj4gPgo+ID4K
PiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cj4KPgo+Cj4gLS0KPiBSZWdhcmRzLAo+IEF0aXNoCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
