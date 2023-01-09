Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF1CC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0v5T7RPg9T3F9+T+0eH4aZmLqVh4gPbgo5I8OVev5e0=; b=VQq2MT/42kwK2Y
	CABvovwyz1vE55J4fXM2rqTOlr9jaAZhxcV6PeBy6r5dfj99NRitAvtu6Uq132af1a8tuemjRhEca
	wlby84wlYj2Feu6Vlx5HFLkaeoESc5nR/kGB5BCE0Ynpqtmqk1516d5IGIV1LQgKbHlUCaFANd+AV
	hdrOx/9r2zeviK1poprjBs62kaHm5/K7KvAyX4vLr1f+ZBU0pFOV22VMJ+pmEpIJoA89Mfh3Da+g6
	qi/QLxcjdVIhWRH+P66aDiT8hbSvXTwJPNn2BbEoFXpW81fk3k560xFSR89lGYnNkDKeVv0Bz/je6
	F/TOmxE/hAviqa6DaQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsRp-001gsL-P5; Mon, 09 Jan 2023 13:44:22 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsHP-001ccU-Oo
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 13:33:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bf43so12979824lfb.6
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chE3iaM/I2AsUGj8pFR1rZVri/HumwNXcqKA4uAuvqQ=;
        b=KA/c+jpPqsYG9RKG7GM44BP+lEburLumWgCNiacm3WfSEEUygXKM7QMNbjYL/y3WbZ
         2bwv3rO+9LnwfgNj5tYaHTZ9cw1Ixo9zH8+w6R8H6h9xV4ReiSSCMOrk06+aGohlJqDE
         4M5lecXw+HQhJpcrX1+zw47bkQvaYE8vYLbmijiG/LEDPbB0bw0nWdhSTN/8RUG7hRwD
         lweV2BruU2LgIJV7zHmNwVVyalobOUwxzot2g5VzRbbqP6KOB8XLbGONBDCW/kUhKNOs
         mxiIoAVtSY2Duh53YTTn5eNjxHGBDwtnHjXazxh+FtWnhFNoqzgBSemgo5WZYKlkNj5g
         9zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chE3iaM/I2AsUGj8pFR1rZVri/HumwNXcqKA4uAuvqQ=;
        b=sbKpSaVBRQ2qK7HQQb0lfoIAFlYTnckoqr0P3zAiBHou5IkxcPwn95kaazZZ8yoadL
         SpCOz01e7DQCqlVcDFFg8CYV7WKPfdeIaHx9jab8JJIgcG9JGEmg278CR7aL79U9QZoc
         0pO0SKuGIFxgZaDOhcGWXo0YNBAxV4HiqNNBdLIQ0LuIYVcu4KI7ThEbALxPeFyk8BIf
         U/GZHvLYF6udLvaAmdHYHzQFzsYafMzmpEuAsWg+dBkaNJIuF859ln6VAUlSmsc/KmhJ
         33Z4rZSydYhCy8vHcUV9+qx4TjUIMOCntVUBCkS3TaPl4Bwg7g0ZUbn6bF3oROllwwR9
         yDTA==
X-Gm-Message-State: AFqh2krzJlj/EPvjJ0wzZR0FkGPly0G38eYwP1sa3V2/nRq1RnGfR3NZ
	ub1B/PeLqiafWjMYOKQYggJb6DMq8rT/Gz4bVCClURRUfhwxxA==
X-Google-Smtp-Source: AMrXdXuHbWNt7mwfQOB8gnRg9VuDp/BXPug0MqwSjKMVuVT1ROH2lXFsRm3JGo7X6iCU5RztA4EUylkun5qlIpdb8RQ=
X-Received: by 2002:a05:6512:3413:b0:4cc:82f6:256f with SMTP id
 i19-20020a056512341300b004cc82f6256fmr189816lfr.668.1673271211866; Mon, 09
 Jan 2023 05:33:31 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com> <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com> <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com> <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
In-Reply-To: <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
From: Kito Cheng <kito.cheng@sifive.com>
Date: Mon, 9 Jan 2023 21:33:20 +0800
Message-ID: <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>, Andy Chiu <andy.chiu@sifive.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_053336_052953_13756217 
X-CRM114-Status: GOOD (  24.39  )
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

SGkgVmluZWV0OgoKPiA+Pj4+IFRoZSBuZXcgS2NvbmZpZyBDT05GSUdfUklTQ1ZfVlNUQVRFX0lO
SVRfQUxMIHNlZW1zIGxpa2UgYQo+ID4+Pj4gaGFjayBib2x0ZWQgb24gdG9wLgo+ID4+PiBJSVVD
LCBtb3N0IG9waW5pb25zIHN1Z2dlc3RlZCB0aGF0IHdlIHNob3VsZCBrZWVwIHRoZSBkZWZhdWx0
IFZlY3Rvcgo+ID4+PiBzdGF0ZSB0byBPTiBpbiB0aHJlYWQ6Cj4gPj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIyMDkyMTIxNDQzOS4xNDkxNTEwLTE3LXN0aWxsc29uQHJpdm9zaW5j
LmNvbS9ULyN1Cj4gPj4gQWN0dWFsbHkgY29tbXVuaXR5IGZlZWRiYWNrIGlzIHRoYXQgdGhleSAq
ZG9uJ3QgKiB3YW50IHRoZSBkZWZhdWx0Cj4gPj4gdmVjdG9yIHN0YXRlIHRvIGJlIG9uIGR1ZSB0
byBwb3dlciBpbXBsaWNhdGlvbnMsIGluY3JlYXNlZCBzdGFjayBhbmQKPiA+PiBtZW1vcnkgdXNh
Z2UgZm9yIHZlY3RvciBjb250ZW50cyAoaW4gdGhhdCB0aHJlYWQgYW5kIGVsc2Ugd2hlcmUgYXMK
PiA+PiB3ZWxsKS4gU28gd2Ugc2hvdWxkIGtlZXAgaXQgZGlzYWJsZWQgYnkgZGVmYXVsdCwgYnV0
IGluZGVlZCB3ZSBjb3VsZAo+ID4+IGhhdmUgdGhhdCBLY29uZmlnIG9wdGlvbiB0byBlbmFibGUg
aXQuIEdyYW50ZWQgZGlzdHJvIGtlcm5lbHMgd2lsbCBrZWVwCj4gPj4gaXQgZGlzYWJsZWQgYnkg
ZGVmYXVsdCwgdGhpcyBsZXRzIHZlbmRvcnMgZW5hYmxlIGl0IHNlbGVjdGl2ZWx5IHVudGlsCj4g
Pj4gdGhlIGZ1bGwgdXNlcnNwYWNlIGVuYWJsaW5nIGJpdHMgYXJlIGluIHBsYWNlLgo+ID4gU2hv
dWxkIHdlIHB1bnQgdGhpcyB0byB0aGUgRUxGIChlLmcuLCB1c2luZyBhIFJJU0MtViBzcGVjaWZp
Ywo+ID4gYXR0cmlidXRlKSBhbmQgdGFrZSBhIHBlci1wcm9jZXNzIGRlY2lzaW9uIG9uIHdoZXRo
ZXIgdG8gc3RhcnQgaW4gT04KPiA+IG9yIE9GRj8KPiA+IEkgZG9uJ3QgZmVlbCBmdWxseSBjb21m
b3J0YWJsZSB3aXRoIGEgS0NPTkZJRyB0aGF0IGNvdWxkIGNoYW5nZSBhbmQKPiA+IGludmFsaWRh
dGUgdGhlIGFzc3VtcHRpb25zIGEgdXNlcnNwYWNlIHByb2Nlc3MgY291bGQgaGF2ZSBtYWRl4oCm
Cj4KPiBUaGUgS2NvbmZpZyBpcyBqdXN0IGEgc3RvcCBnYXAgZm9yIHZlbmRvcnMgdG8gZW5hYmxl
IFYgZGV2ZWxvcG1lbnQgd2hpbGUKPiB0aGUgZnVsbCB1c2Vyc3BhY2Ugc3R1ZmYgaXMgc29ydGVk
IG91dC4KPgo+IEluZGVlZCBSSVNDVl9BVFRSSUJVVEVTIHNlY3Rpb24gaGFzIC1tYXJjaCBpbmZv
LCBidXQgd2UgbmVlZCB0byBkbyBzb21lCj4gZGV2ZWxvcG1lbnQgYXJvdW5kIGl0IHRvIHBhcnNl
IGl0IGFuZCB1c2UgaXQuCgpJIGRvbid0IHRoaW5rIFJJU0NWX0FUVFJJQlVURVMgaXMgdGhlIHJp
Z2h0IHBsYWNlIHRvIGNoZWNrIHRoYXQgLSBldmVuIGlmIHRoZQpwcm9ncmFtIGNvbXBpbGVzIHdp
dGhvdXQgViwgaXQgc3RpbGwgY2FuIGVuYWJsZSBWIGFuZCB0aGVuIGdldCBwZXJmb3JtYW5jZQpi
ZW5lZml0IGJ5IGlmdW5jIGluIGdsaWJjLCBvciBldmVuIHNvbWUgM3JkIHBhcnR5IGxpYnJhcmll
cyBtaWdodCBhbHNvIGJlCm9wdGltaXplZCB3aXRoIFYgZXh0LgoKQW5kIGRvbid0IGZvcmdldCBv
dGhlciBzaGFyZWQgbGlicmFyaWVzIGluIHRoZSBzeXN0ZW0sCmFyZSB3ZSBnb2luZyB0byBjaGVj
ayBhbGwgZGVwZW5kZW50IGxpYnJhcmllcyBhdCBwcm9ncmFtIGxvYWQgdGltZT8KaXQgd2lsbCBy
ZXF1aXJlIHJlc29sdmluZyB0aGUgbGlicmFyeSBkZXBlbmRlbmN5IGF0IGtlcm5lbC4KT3Igd2Ug
aW50ZW5kIHRvIGVuYWJsZSBWIG9ubHkgaWYgZXhlY3V0YWJsZSBjb21waWxlcyB3aXRoIFY/Cgo+
IFRoZXJlIGFyZSBzdGlsbCBjb3JuZXIgY2FzZXMgc3VjaCBhcyBub24tViBleGVjdXRhYmxlIGRs
b3BlbiBhIGRzbyAtIHNvCj4ga2VybmVsIGVsZiBwYXJzZXIgZG9pbmcgdGhpcyBtaWdodCBub3Qg
Y292ZXIgYWxsIGNhc2VzLgo+Cj4gU2ltaWxhciBsb2dpYyB3aWxsIG5lZWQgdG8gYmUgYWRkZWQg
dG8gZ2xpYmMgbG9hZGVyIC0gZXZlbnR1YWxseS4KPgo+IEFkZGluZyB0aGUgZnVsbCBwbHVtYmlu
ZyBpcyBhIGNoaWNrZW4tYW5kLWVnZyBwcm9ibGVtLgo+Cj4KPiA+IEFsdGVybmF0aXZlbHksIHdl
IGNvdWxkIGVzdGFibGlzaCB0aGUgY29udmVudGlvbiBvZiBoYXZpbmcgdHdvIHN0dWIKPiA+IGxp
YnJhcmllcyB0aGF0IHNldCB1cCBlaXRoZXIgZW5hYmxlZCBvciBkaXNhYmxlIHN0YXRlIGZyb20g
dGhlaXIKPiA+IC5pbml0X2FycmF5IHRvIHByb3ZpZGUgYSBtZWNoYW5pc20gZm9yIGZvbGtzIHRo
YXQgd2FudCB0byBtYWtlIGFuCj4gPiBleHBsaWNpdCBhc3N1bXB0aW9uLiAgQWx0aG91Z2ggdGhp
cyBtYXkgdHJ5IHRvIG92ZXJkZXNpZ24gYSBzb2x1dGlvbgo+ID4gZm9yIGEgbm9uLWlzc3VlLgo+
Cj4gSSB3YXMgdGhpbmtpbmcgbW9yZSBhbG9uZyB0aGUgbGluZXMgb2YgeDg2IEdMSUJDX1RVTkFC
TEVTIHRvIGVuYWJsZSBpdAo+IHZpYSBlbnYvc3ViLXNoZWxsIG9uIGEgcGVyLXRhc2sgYmFzaXMg
LSB0aGUgdHVuYWJsZSBob29rIGNvdWxkIGluIHR1cm4KPiB2ZXJpZnkgdGhhdCBWZWN0b3Igc3Vw
cG9ydCBkb2VzIGV4aXN0IC0gb3IgaXQgY291bGQgaW52b2tlIHRoZSBwcmN0bAo+IHVuY29uZGl0
aW9uYWxseSAod2hpY2ggd291bGQgZmFpbCBpZiBWIGRpZG4ndCBleGlzdCBldGMpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
