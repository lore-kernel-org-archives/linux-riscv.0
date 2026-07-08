Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D15C43602
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moWGabGoP61bg1iwL2JpTBf2WRiV3anN85EDuKpEmwA=; b=AZ5o8Z9iPcupVX
	6mIhZaVeN43fv3tw2giyBC8Un5iBVbeuboK3BHMNSsbhYrsJoGnhPZ4vBbA3hY2tHmBTE0tryLAx5
	XCV6L0TID9QgTPThCZ8o2KQwxN2lMFMCKYfTTYaO1gpZKZpAs0Rre5GFAbGLhd72qNOSmjL6t8r4w
	fFON/z5G2VRwFeW1KS/qe3YeteArwXQbFAwsEKBNLmnaOJRHcFW6XAmRRGTi0YXQ83xHbN1Qj8ToK
	YZG34+EkL31C+XXvYM5k5to5YXa/JuLe4hpO5Cc8o7YATy7zXdg/kpOChk+plxaS2OnV+WUuUVWY3
	UXn5Uo5zduJozyJ+04RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMEl-0000000GRrK-0ASX;
	Wed, 08 Jul 2026 06:58:27 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMEh-0000000GRqi-1Z40
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 06:58:26 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38175907a56so1254781a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 23:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783493902; cv=none;
        d=google.com; s=arc-20260327;
        b=MYQVu/etIlXXnGyFInFWNRW+9xsCcD5vdSI1Qgr+tHEggyz9Q/7CSlashvEH5r3I5M
         gMoEcxK/SxcL5RSYUpzP/nA+YqppoXH667AVuClERWDPRJ4TPh5mTVOUpNak4QJcBfG9
         Oj421xZcMMZj4m+Z7dzgsJ2qt5c0GXabJbcCSU8RJ3ZKTUUA8AJH5XVQrPdzkTmRYabp
         w9M7MzpPu5e30NxJoZr4mL1qwC/c1c1Xn7KxnG+u5++CArNuzGjnK75UYtk74xUXmo23
         EY3iSDweA2PwCMJ1w5Zk2K+vYNX2noIP7hxXL+WB18IPJa0hBvf34RZK6JTgEUrsLBZj
         DbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++Np+i7QbYkMJq7srOxofh9iDJgIYXe+19kl+BTYoIk=;
        fh=/duJxvSFY1pX153ZWwoSlD0ZPWn/clVXatsIue2jzq8=;
        b=r6XPhobbLlLyg8Xs5CalLTJ9CfI+JTKxWtF37VIN43IZ+fms/zZR5RdAg5ryk0titV
         Z4XO7vII3CH8ZU20WMuwHDIWv4gatfmPBAutIosGZBV3f3fYuWMLuREBI5VSC0FYZxX5
         5U/suv27XNS5w+zk+2j98h5J3ao3b8/XdNy/VWJNwfhkF2Uyvf1gQOicO2W7EfudaG2r
         JpPHFdj5Xa9eLZ9wUKXWm36ytUTEwrw8IRai+Kc5tubxkmat0y1uqijGp569SpOsn3sT
         cuGPpiOIDMMm/PTD8J3VtYrGwDCc8oGoX394WU8uUwGNz/QJupmEGF0Wm/qjin7AtS3m
         inQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783493902; x=1784098702; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=++Np+i7QbYkMJq7srOxofh9iDJgIYXe+19kl+BTYoIk=;
        b=sRWZn6MLc25nRx+XBxocIiWbPqcwjFo4zRxNpB1QpuIv7nsMG9W1ZnR0pHeULJh/y1
         NTakTueQskv5vQWdrgnkfNnc+cVYGiqakaNJ2mHpWBXiGI5M5hppihzxvN1lfbyFbUyH
         RFiUa13nPkpUSnIfSDRXgaQ5gp1pkZ3H3xduWz/Y8fdKxqDevtVWvh//RXFdDXFl+qKa
         k1eYBhHVk+C0BT4AzyQxY9spzTv7R8ZwEWPmFob5F5G0Hv8OLZqxwakTKB/ooUig59r3
         tSG+mFRM67JYjpDio5rU2nyu+wGqHciclSn58TBR3OGa9FVPlLHnn01enB4ynHQkm8wS
         Z/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783493902; x=1784098702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++Np+i7QbYkMJq7srOxofh9iDJgIYXe+19kl+BTYoIk=;
        b=fI3q+4KQp9a7p68jhzuDShmGqiPBlARcyYAOBn86ElfUQyMuBdHiWjC6uuXBY5Ttkm
         9mGuUMHafbrajpTcYFp9eoFkGHlEypvMfu8dwm241AAjphogoI3uTrtr9qbygy6Oi2Wg
         IABU41NKKWV2xd94IiW/6Qy40QpskT0NMA77jPUpPy+CRtW4iGD8Vjci1dsCOOkebyft
         wfBhNb1nlXJPVER3rBaq6JevpIP5aUEtwsz4kGvIqv1EDQsExcCuszMTldCbzsiGvSCV
         35G3MM04nwlcb7KcO2izNydcUdAk5lMacJLAsTWXKF0rvVn09FlOrnelz+RMEBk/NCSr
         FEcw==
X-Forwarded-Encrypted: i=1; AHgh+Rqg5y2+jGTkvv/14wkTo9DChbXMm6ZXQez58p198r08hyoqiZKouXLRp1/H2yEDcMC/dkP3J4EUTpf0cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkBpwmzRYNLsypDqYtv1V23C89McJve1eJKD1hHmsVBaGYwfnb
	ShSOpuNzz+6CM53miRMJuRCaY1LXNYcrBF/nkZ1Ni75YJSA5/bY93j+fla01XDCzr6nuOsM56r4
	6WP0uBXDb+Vav4EYsHEI4jQBXoY2qK1A=
X-Gm-Gg: AfdE7clNzMK3kVUQD2XuEUuWSUS90fSEdvRnnZfxRTLMvzSXJI1UBEAPjlQMMGa1aBN
	t1dYkKumbTGMQc6TslfuH3zPmN3cqtIKqqRJzAQ1m5s9LHmOzngXejBHsGrv3qvzJTUlfyoF4HO
	PBEBxBWLs0t/v+OSw1tivG7cbybqoKikdv5bwlr/QkyEUV6SEdU6EK3A2N7u55BwEEhUf4+RSno
	3hJNq7+zTkWt9nL4ro8aA47eRTlWdWXtmSfmvw4a187nrlYPIkkJOVGggwPfQGSJ+7GvGrH
X-Received: by 2002:a05:6a21:168b:b0:3b4:8c67:51d4 with SMTP id
 adf61e73a8af0-3c09b4ab238mr8981970637.39.1783493901839; Tue, 07 Jul 2026
 23:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <ab2yd35rm6OgZUmb@gpd4> <20260320222916.19987-1-boqun@kernel.org>
 <CAJM55Z-hiNDuu5UwoBe7m0wq+_WJrRY0cwopALUgpG+r3ixj8g@mail.gmail.com>
 <ajQPAk_ALP-84obp@MacBook-0RXW5> <CAJM55Z_15U7GssTOims1=J34CYSj=8CDE_di1kJYs5hE3=J53w@mail.gmail.com>
 <ajlW4oSzEqav6gxc@MacBook-0RXW5> <CAJM55Z_7N40ARWGoZg04p-NnAy-w10v4=Em-e4Bx4+oNYMGBLg@mail.gmail.com>
 <80773b89-f333-4c82-99b5-3fca44ea93b3@sifive.com> <CAJM55Z_aUzPieiGKPgr_iETovgyGB0EUFau+=tLxZksT9CkpYQ@mail.gmail.com>
 <1a9a672d-914d-43c2-b1da-6a0deede4dac@leemhuis.info>
In-Reply-To: <1a9a672d-914d-43c2-b1da-6a0deede4dac@leemhuis.info>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Wed, 8 Jul 2026 09:58:08 +0300
X-Gm-Features: AVVi8CcDPihGLFO6KDd2QFz3SBo9Xu3AC0vfTDbgAUFDI1HQZllfyXn0bskFxwc
Message-ID: <CA+fTLhissp1Vrezd73iEzjrO808W1hrOF4ry-Tc0VrbqDsRKQw@mail.gmail.com>
Subject: Re: [PATCH v2] rcu: Use an intermediate irq_work to start process_srcu()
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Boqun Feng <boqun@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, frederic@kernel.org, neeraj.iitr10@gmail.com, 
	urezki@gmail.com, boqun.feng@gmail.com, rcu@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrea Righi <arighi@nvidia.com>, Zqiang <qiang.zhang@linux.dev>, 
	linux-riscv@lists.infradead.org, Sarah Emery <sarah.emery@canonical.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_235823_441885_A76B6D2C 
X-CRM114-Status: GOOD (  38.59  )
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

S29udGFrdCBUaG9yc3RlbiBMZWVtaHVpcyAoPHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm8+KSBr
aXJqdXRhcwprdXVww6RldmFsIEUsIDYuIGp1dWxpIDIwMjYga2VsbCAxNDozMzoKPgo+IE9uIDYv
MjQvMjYgMTA6NTUsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+ID4gUXVvdGluZyBTYW11
ZWwgSG9sbGFuZCAoMjAyNi0wNi0yMyAxNzo1MzoxOSkKPiA+PiBPbiAyMDI2LTA2LTIzIDQ6MzQg
QU0sIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+ID4+PiBRdW90aW5nIEJvcXVuIEZlbmcg
KDIwMjYtMDYtMjIgMTc6Mzg6MTApCj4gPj4+PiBPbiBTYXQsIEp1biAyMCwgMjAyNiBhdCAwNToy
NToyNUFNIC0wNDAwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+Pj4+PiBRdW90aW5n
IEJvcXVuIEZlbmcgKDIwMjYtMDYtMTggMTc6MzA6MTApCj4gPj4+Pj4+IE9uIFRodSwgSnVuIDE4
LCAyMDI2IGF0IDA4OjExOjM2QU0gLTA1MDAsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+
ID4+Pj4+Pj4gUXVvdGluZyBCb3F1biBGZW5nICgyMDI2LTAzLTIwIDIzOjI5OjE2KQo+ID4+Pj4+
Pj4+IFNpbmNlIGNvbW1pdCBjMjdjZWE0NDE2YTMgKCJyY3U6IFJlLWltcGxlbWVudCBSQ1UgVGFz
a3MgVHJhY2UgaW4gdGVybXMKPiA+Pj4+Pj4+PiBvZiBTUkNVLWZhc3QiKSB3ZSBzd2l0Y2hlZCB0
byBTUkNVIGluIEJQRi4gSG93ZXZlciBhcyBCUEYgaW5zdHJ1bWVudCBjYW4KPiA+Pj4+Pj4+PiBo
YXBwZW4gYmFzaWNhbGx5IGV2ZXJ5d2hlcmUgKGluY2x1ZGluZyB3aGVyZSBhIHNjaGVkdWxlciBs
b2NrIGlzIGhlbGQpLAo+ID4+Pj4+Pj4+IGNhbGxfc3JjdSgpIG5vdyBuZWVkcyB0byBhdm9pZCBh
Y3F1aXJpbmcgc2NoZWR1bGVyIGxvY2sgYmVjYXVzZQo+ID4+Pj4+Pj4+IG90aGVyd2lzZSBpdCBj
b3VsZCBjYXVzZSBkZWFkbG9jayBbMV0uIEZpeCB0aGlzIGJ5IGZvbGxvd2luZyB3aGF0IHRoZQo+
ID4+Pj4+Pj4+IHByZXZpb3VzIFJDVSBUYXNrcyBUcmFjZSBkaWQ6IHVzaW5nIGFuIGlycV93b3Jr
IHRvIGRlbGF5IHRoZSBxdWV1aW5nIG9mCj4gPj4+Pj4+Pj4gdGhlIHdvcmsgdG8gc3RhcnQgcHJv
Y2Vzc19zcmN1KCkuCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBbYm9xdW46IEFwcGx5IEpvZWwncyBm
ZWVkYmFja10KPiA+Pj4+Pj4+PiBbYm9xdW46IEFwcGx5IEFuZHJlYSdzIHRlc3QgZmVlZGJhY2td
Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBSZXBvcnRlZC1ieTogQW5kcmVhIFJpZ2hpIDxhcmlnaGlA
bnZpZGlhLmNvbT4KPiA+Pj4+Pj4+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9hYmp6dnpfdExfc2lWMTdzQGdwZDQvCj4gPj4+Pj4+Pj4gRml4ZXM6IGNvbW1pdCBjMjdjZWE0
NDE2YTMgKCJyY3U6IFJlLWltcGxlbWVudCBSQ1UgVGFza3MgVHJhY2UgaW4gdGVybXMgb2YgU1JD
VS1mYXN0IikKPiA+Pj4+Pj4+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yY3UvM2M0
YzVhMjktMjRlYS00OTJkLWFlZWUtZTBkOTYwNWI0MTgzQG52aWRpYS5jb20vIFsxXQo+ID4+Pj4+
Pj4+IFN1Z2dlc3RlZC1ieTogWnFpYW5nIDxxaWFuZy56aGFuZ0BsaW51eC5kZXY+Cj4gPj4+Pj4+
Pj4gVGVzdGVkLWJ5OiBBbmRyZWEgUmlnaGkgPGFyaWdoaUBudmlkaWEuY29tPgo+ID4+Pj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEJvcXVuIEZlbmcgPGJvcXVuQGtlcm5lbC5vcmc+Cj4gPj4+Pj4+Pgo+
ID4+Pj4+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2gsIHdoaWNoIGlzIG5vdyB1cHN0cmVhbSBhcwo+
ID4+Pj4+Pj4gN2M0MDVmYjMyNzliICgicmN1OiBVc2UgYW4gaW50ZXJtZWRpYXRlIGlycV93b3Jr
IHRvIHN0YXJ0IHByb2Nlc3Nfc3JjdSgpIikKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBVbmZvcnR1bmF0
ZWx5IGl0IHNlZW1zIHRvIGhhbHQgYm9vdGluZyBvbiB0aGUgQWxsd2lubmVyIEQxIHNpbmdsZS1j
b3JlIFJJU0MtVgo+ID4+Pj4+Pj4gU29DIGJvdGggb24gdGhlIDcuMCBhbmQgNy4xIGtlcm5lbHM6
Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pgo+ID4+Pj4+PiBCeSAic2luZ2xlLWNvcmUiLCBpcyBpdCBvbmx5
IG9uZSBDUFUgaW4gdGhhdCBzeXN0ZW0/Cj4gPj4+Pj4+Cj4gPj4+Pj4+PiBodHRwczovL2VzbWls
LmRrL2QxLTcuMC50eHQKPiA+Pj4+Pj4+IGh0dHBzOi8vZXNtaWwuZGsvZDEtNy4xLnR4dAo+ID4+
Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IFllcywgdGhlIFNvQyBvbmx5IGhhcyBvbmUgQ1BVIGNvcmUg
Y2FwYWJsZSBvZiBydW5uaW5nIExpbnV4IGF0IGxlYXN0Lgo+ID4+Pj4+Cj4gPj4+Pj4+IEZyb20g
dGhlIGNhbGxzdGFjaywKPiA+Pj4+Pj4KPiA+Pj4+Pj4gWyAgMjQzLjAwMjgxOF0gImVjaG8gMCA+
IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyBt
ZXNzYWdlLgo+ID4+Pj4+PiBbICAyNDMuMDEwNjgxXSB0YXNrOmt3b3JrZXIvMDowICAgICBzdGF0
ZTpEIHN0YWNrOjAgICAgIHBpZDo5ICAgICB0Z2lkOjkgICAgIHBwaWQ6MiAgICAgIHRhc2tfZmxh
Z3M6MHg0MjA4MDYwIGZsYWdzOjB4MDAwMDAwMDAKPiA+Pj4+Pj4gWyAgMjQzLjAyMTg1OF0gV29y
a3F1ZXVlOiBkZXZpY2VfbGlua193cSBkZXZpY2VfbGlua19yZWxlYXNlX2ZuCj4gPj4+Pj4+IFsg
IDI0My4wMjc1ODddIENhbGwgVHJhY2U6Cj4gPj4+Pj4+IFsgIDI0My4wMzAwNzldIFs8ZmZmZmZm
ZmY4MDc0NWI2Nj5dIF9fc2NoZWR1bGUrMHgyMzIvMHg1MzAKPiA+Pj4+Pj4gWyAgMjQzLjAzNTM2
NV0gWzxmZmZmZmZmZjgwNzQ1ZTgyPl0gc2NoZWR1bGUrMHgxZS8weDk0Cj4gPj4+Pj4+IFsgIDI0
My4wNDAyOThdIFs8ZmZmZmZmZmY4MDc0YWE3YT5dIHNjaGVkdWxlX3RpbWVvdXQrMHg2ZS8weGE4
Cj4gPj4+Pj4+IFsgIDI0My4wNDU5MjldIFs8ZmZmZmZmZmY4MDA0ZDZhMD5dIHdha2V1cF9wcmVl
bXB0KzB4OGMvMHg5OAo+ID4+Pj4+PiBbICAyNDMuMDUxMzgwXSBbPGZmZmZmZmZmODA3NDZhZWU+
XSB3YWl0X2Zvcl9jb21wbGV0aW9uKzB4M2EvMHhiMAo+ID4+Pj4+PiBbICAyNDMuMDU3MjY3XSBb
PGZmZmZmZmZmODAwODcyMjY+XSBfX3N5bmNocm9uaXplX3NyY3UucGFydC4wKzB4NGUvMHg2MAo+
ID4+Pj4+PiBbICAyNDMuMDYzNzEyXSBbPGZmZmZmZmZmODAwODQ0MTQ+XSByY3VfdGFza3NfZ2V0
X2dwX2RhdGErMHhjLzB4MTAKPiA+Pj4+Pj4gWyAgMjQzLjA2OTY5OV0gWzxmZmZmZmZmZjgwNDkw
ODk4Pl0gZGV2aWNlX2xpbmtfcmVsZWFzZV9mbisweDE0LzB4ODAKPiA+Pj4+Pj4gWyAgMjQzLjA3
NTg1MF0gWzxmZmZmZmZmZjgwMDNkYmQwPl0gcHJvY2Vzc19vbmVfd29yaysweGY4LzB4MWM4Cj4g
Pj4+Pj4+IFsgIDI0My4wODE1ODNdIFs8ZmZmZmZmZmY4MDAzZTI4Mj5dIHdvcmtlcl90aHJlYWQr
MHgxMWEvMHgyNTQKPiA+Pj4+Pj4gWyAgMjQzLjA4NzEyN10gWzxmZmZmZmZmZjgwMDNlMTY0Pl0g
cmVzY3Vlcl90aHJlYWQrMHgzYTAvMHgzYTQKPiA+Pj4+Pj4gWyAgMjQzLjA5Mjc1NV0gWzxmZmZm
ZmZmZjgwMDNlMTY0Pl0gcmVzY3Vlcl90aHJlYWQrMHgzYTAvMHgzYTQKPiA+Pj4+Pj4gWyAgMjQz
LjA5ODM4MV0gWzxmZmZmZmZmZjgwMDQ0OTllPl0ga3RocmVhZCsweGJlLzB4ZTQKPiA+Pj4+Pj4g
WyAgMjQzLjEwMzIzMV0gWzxmZmZmZmZmZjgwMDEzNDllPl0gcmV0X2Zyb21fZm9ya19rZXJuZWwr
MHg2LzB4ZDAKPiA+Pj4+Pj4gWyAgMjQzLjEwOTEyN10gWzxmZmZmZmZmZjgwMDUxN2E4Pl0gc2No
ZWR1bGVfdGFpbCsweDgvMHhhYwo+ID4+Pj4+PiBbICAyNDMuMTE0NDEwXSBbPGZmZmZmZmZmODAw
NDQ4ZGM+XSBrdGhyZWFkc19vbmxpbmVfY3B1KzB4MC8weDQKPiA+Pj4+Pj4gWyAgMjQzLjEyMDEy
MV0gWzxmZmZmZmZmZjgwNzRiZTBhPl0gcmV0X2Zyb21fZm9ya19rZXJuZWxfYXNtKzB4MTIvMHgx
OAo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIHdpbGwgZ3Vlc3MgZm9yIHNvbWUgcmVhc29ucyB0aGUgaXJx
X3dvcmsgd2FzIG1pc3NlZCBvciB0aGUgSVBJIG5ldmVyCj4gPj4+Pj4+IGhhcHBlbmVkLiBJcyBp
dCBwb3NzaWJsZSBmb3IgeW91IHRvIGVuYWJsZSB0cmFjZSBwb2ludHMgaXBpX3NlbmRfY3B1IGFu
ZAo+ID4+Pj4+PiBpcGlfZW50cnkgdG8gZ2V0IG1vcmUgaW5mb3JtYXRpb24/Cj4gPj4+Pj4KPiA+
Pj4+PiBJIGhhdmUgdG8gYWRtaXQgSSd2ZSBub3QgdXNlZCB0cmFjZXBvaW50cyBiZWZvcmUsIGJ1
dCBpdCBzZWVtcyBsaWtlIG9ubHkKPiA+Pj4+PiBpcGlfc2VuZF9jcHUgYW5kIGlwaV9zZW5kX2Nw
dW1hc2sgaXMgYXZhaWxhYmxlIG9uIFJJU0MtVi4KPiA+Pj4+PiBJJ3ZlIG5vdyBhZGRlZCB0cmFj
ZV9ldmVudD1pcGk6KiBhbmQgdHBfcHJpbnRrIHRvIHRoZSBjb21tYW5kIGxpbmUsIGFuZCB0aGlz
Cj4gPj4+Pgo+ID4+Pj4gVGhhbmsgeW91ISBZZWFoLCB0aGlzIGlzIHdoYXQgSSBtZWFudCA7LSkK
PiA+Pj4+Cj4gPj4+Pj4gaXMgd2hhdCBJIGdldDoKPiA+Pj4+PiBodHRwczovL2VzbWlsLmRrL2Qx
LTcuMC0yLnR4dAo+ID4+Pj4+Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+IFsgICAgMC4wNzExMzJdIHJj
dTogICAgIE1heCBwaGFzZSBuby1kZWxheSBpbnN0YW5jZXMgaXMgMTAwMC4KPiA+Pj4+IFsgICAg
MC4wNzc4MzddIGlwaV9zZW5kX2NwdTogY3B1PTAgY2FsbHNpdGU9aXJxX3dvcmtfcXVldWUrMHgy
Mi8weDRjIGNhbGxiYWNrPXNyY3VfaXJxX3dvcmsrMHgwLzB4NTgKPiA+Pj4+Cj4gPj4+PiBJcyB0
aGlzIHRoZSBsYXN0IGxpbmUgeW91IGNhbiBzZWUgZnJvbSB5b3VyIChzZXJpYWw/KSBjb25zb2xl
LCBvciB3ZSBhcmUKPiA+Pj4+IG1pc3NpbmcgYSBmZXcgbW9yZSBsaW5lcz8gTWF5YmUgaXQnbGwg
c2hvdWxkIHRoZSBzYW1lIGh1bmcgdGFzawo+ID4+Pj4gbWVzc2FnZXM/Cj4gPj4+Cj4gPj4+IFll
cywgc29ycnkgZm9yIG5vdCBiZWluZyBjbGVhciBhYm91dCB0aGF0LiBUaGlzIGlzIHRoZSBleGFj
dCBzYW1lIGJpbmFyeSBib290ZWQKPiA+Pj4gd2l0aG91dCB0aGUgdHdvIGV4dHJhIGNvbW1hbmQg
bGluZSBwYXJhbWV0cnM6Cj4gPj4+IGh0dHBzOi8vZXNtaWwuZGsvZDEtNy4wLTMudHh0Cj4gPj4+
Cj4gPj4+IEJ1dCB3aXRoIHRoZSB0d28gcGFyYW1ldGVycyBhZGRlZCB0aGUgYm9hcmQgcmVib290
cyBiZWZvcmUgZ2V0dGluZyB0byB0aGUgaHVuZwo+ID4+PiB0YXNrIG1lc3NhZ2VzLiBUaGUgYm9v
dGxvYWRlciBlbmFibGVzIHRoZSB3YXRjaGRvZywgc28gSSB0aGluayB3aGF0IGhhcHBlbnMgaXMK
PiA+Pj4gdGhhdCB0aGUga2VybmVsIGhhbHRzIGVhcmxpZXIgd2l0aCB0aGUgdHJhY2Vwb2ludHMg
ZW5hYmxlZCwgYW5kIGRvZXNuJ3QgZ2V0IHRvCj4gPj4+IGxvYWQgdGhlIHdhdGNoZG9nIGRyaXZl
ciB0byBrZWVwIHRoZSBtYWNoaW5lIGZyb20gcmVib290aW5nLgo+ID4+Pgo+ID4+PiBUaGUgc2Ft
ZSBoYXBwZW5zIHdpdGgganVzdCB0cmFjZV9ldmVudD1pcGk6KiBhZGRlZCwganVzdCB3aXRob3V0
IHRoZSBsYXN0Cj4gPj4+IG1lc3NhZ2UgYWJvdmUuCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gVGhlIGlw
aV9zZW5kX2NwdSBtZXNzYWdlIG1lYW5zIFJDVSB3YXMgYWJsZSB0byBzZW5kIGFuIElQSSwgbm93
IGlmIHRoZXJlCj4gPj4+PiBpcyBubyBpcGlfaGFuZGxlciBiZXR3ZWVuIHRoZSBzZW5kIGFuZCB0
aGUgaHVuZyB0YXNrLCB0aGF0IHdvdWxkIG1lYW4KPiA+Pj4+IHRoZSBJUEkgd2FzIG1pc3NlZC4K
PiA+Pgo+ID4+IEFzc3VtaW5nIHRoYXQgeW91ciBPcGVuU0JJIHZlcnNpb24gaXMgZXhhY3RseSB2
MS4zIHBlciB0aGUgYm9vdCBsb2csIGFuZCBub3QKPiA+PiAidjEuMyArIHBhdGNoZXMiLCB0aGVu
IHlvdSB3b3VsZCBpbmRlZWQgbm90IGJlIHJlY2VpdmluZyBJUElzLiBZb3UgbmVlZCBhdCBsZWFz
dAo+ID4+IHRoaXMgY29tbWl0OiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3Jj
L29wZW5zYmkvY29tbWl0LzQ0NmZhNjVlYjU3OQo+ID4+IChpbmNsdWRlZCBpbiB2MS40KSBvciBh
bHRlcm5hdGl2ZWx5IHRvIGFkZCB0aGUgQ0xJTlQgdG8gdGhlIE0tbW9kZSBkZXZpY2V0cmVlLgo+
ID4KPiA+IFNvIHRoZW4gd2UncmUgaW4gYSBzaXR1YXRpb24gc2ltaWxhciB0byBbMV0sIHdoZXJl
IHVwZ3JhZGluZyB0aGUga2VybmVsIGZyb20KPiA+IDYuMTkgdG8gNy4wIHJlcXVpcmVzIHlvdSB0
byB1cGRhdGUgdGhlIGZpcm13YXJlIGZpcnN0Lgo+Cj4gV2hpY2ggbm9ybWFsbHkgc2hvdWxkIG5l
dmVyIGhhcHBlbiB0byBlbnN1cmUgdXNlcnMgZmVlbCBzYXZlIHRvIHVwZGF0ZQo+IHRoZSBrZXJu
ZWwuIEJ1dCBJIHdvbmRlciBpZiB0aGF0IGlzIHJlbGV2YW50LCBhcyBJbmRyZWsgS3J1dXNhIHJl
cG9ydGVkCj4gcHJvYmxlbXMgd2l0aCB0aGF0IGJvYXJkLCB0b28gLS0gYW5kIHRoZXJlIGlzIGEg
Zml4IHRoYXQgZml4ZXMgaXQ6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3Yv
MjAyNjA2MjQyMjA0MzQuNDE4MzczMi0xLWZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmcvCj4KPiBE
b2VzIHRoYXQgbWF5YmUgZml4IHlvdXIgcHJvYmxlbSwgdG9vIChldmVuIGlmIGl0IHdhcyBiaXNl
Y3RlZCB0byBhCj4gZGlmZmVyZW50IGNvbW1pdCwgaXQgbWlnaHQgYmUgcmVsYXRlZCBzb21laG93
LCB0aGF0J3Mgd2h5IEknbSBhc2tpbmcpPwo+Cj4gQ2lhbywgVGhvcnN0ZW4KPgoKSSB0ZW5kIHRv
IHRoaW5rIHdlIGhhdmUgdHdvIGRpZmZlcmVudCBzaXR1YXRpb25zIGhlcmUuIEkgYW0gdXNpbmcK
bmV3ZXIgT3BlblNCSSAodjEuOCkgYW5kIGFuIGV4cGVyaW1lbnRhbCB1LWJvb3QgYmFzZWQgb24g
bmV3ZXIKdjIwMjYuMDctcmMxIFsxXS4KU28sIG15IGZpcm13YXJlIGlzIGRpZmZlcmVudCwgYWxz
byB0aGUgY29udGV4dCBFbWlsIGlzIHBvaW50aW5nIHRvIGlzIGRpZmZlcmVudC4KCkJlc3QgcmVn
YXJkcywKSW5kcmVrCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2lrcnV1c2EvdS1ib290L3RyZWUv
djIwMjYtMDctcmMxLXRoZWFkLWJhc2UtYjEKCgo+ID4gVG8gbWUgYW5kIGZyb20gdGhlIHRocmVh
ZAo+ID4gdGhhdCBzZWVtcyBsaWtlIGEgcmVhbGx5IG9idmlvdXMgcmVncmVzc2lvbi4gU28gdGhl
IHF1ZXN0aW9uIGlzLCBob3cgY2FuIHdlIG1ha2UKPiA+IHRoZSBjdXJyZW50IGtlcm5lbCB3b3Jr
IGxpa2UgPCA3LjAga2VybmVscyB3b3JrZWQ/Cj4gPgo+ID4gWzFdOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvODdqemdqbmg5ei5mZnNAdGdseC8jdAo+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
