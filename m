Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23214107638D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 17:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1J333qb/nyqVBRJIwJ6+4NfhYmu6iHxFI/bESlKbt8A=; b=YvnGT+U/q38ef6
	lshzMNQad36XPTYAC3pKEjnvv7LUo+wk8YqmmXu7nAjmeYt+7/LRlRH+jsSDjU2ROhUDpXpBNlocf
	EVFueRhNfmWeMc5YzpBG3WfGFsP8jFAsrO2dyMDE5ZBoHJizZADhogNkT+nPB4Hghpvc+cjZsyfxe
	3M94uEPFW02qQV86o3k71syVqC+rxcszEouIFmiEVS8WSlUYdL58wKmmz2bWnRRwvbrSicdxyliNl
	xoEpeAtr1wezV9dO+H+GoKr0jmaHWWoeFsSlj2VAuNK9zUSZrnnimX4YEuSBW5Tv3GlAy7IcKkRpJ
	P08t89rWyK3A9EyGUBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zXi-0000000Fs5M-31Dq;
	Wed, 01 Apr 2026 17:39:50 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zXf-0000000Fs4b-2kGJ
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 17:39:48 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2bd801b40dbso11137eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065186; cv=none;
        d=google.com; s=arc-20240605;
        b=glr1q8ndr3odqe1i0xTFfS9JqG2C3c4j9Uhbxk17Bgd0uzo0orOL83DFQlzaY5bFx3
         PDvs3uj0Ia1TUn6xZ6v2Iq/+H6/Eu7n33WMF8GFEQPGKSwO+dGMQDM1zkKyQdeRIHyB7
         6LWBuzjz/UVC+Ucplk2gKftpo/mux/jkqdtcigxxmcskjThmlAZOhLyvqBj6OyXRSvOW
         zoNBgUhmgP2F7iweMCist4TIuyxkiaUm8cUwvxqm7hcSNYpeVhepNa+12VacOZrB/1Gi
         EWPi3bovzHvV/WEwYV9O5f7IL8ouuM3zV5+btIr4HKz4/teQ9PpKr2jAZLVje3e/r+Tp
         4CVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=+xEi0khJr42Dbx8VpuZ5cAxC5YrBjwjsDdjuScxPpCU=;
        b=JqxTT4iBjGnxaES3kR9dFzIyUj+GZtEtRyiBPL/9hMroVVvTR7tjrPSR3chkX7TYdd
         IRwfhaIW/2lmWoCx3F/1/NFQzFWzTHRac2gHrp89UCLliFxBu6e7eTXDWAJGCah0YyRj
         ynlUGUQ2HBycw83CTd/IvJ11prRU7j8Z/vRFAhsE+0LNtSIn0xGRXKmNPz42zu4ctcZJ
         +W7MIZSIW3kz09YEmc7jYWaHRqlc4YC9o2XToMEBO6FWquT3miM5MDcnjmk7mj6Vt0Qe
         IdTHcF94Z8f7zZEjArYi6pHuaCUtTdMzZjbnxMTMzgVYEnVBSC2OLhBlNdKfnMzuPAcd
         7A2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065186; x=1775669986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=ahGTKxw3fK/tgHj7rh5fyGt0TKoNIWue5dsPh5NYW13xrUwtdAEImGJicX6HxVVzJX
         HL0sYbNcWqtCo4ZRLHYsdEdhXY318A6eIntcVNbXr1yDE7BoEWJZltrq8YOnEI3MtssX
         dXOqwsroiL3WSilos7fvGINbuMTdpuAT4erBXIXrk8bZOF3pAWDBQH9PhwJ86OvjEBPA
         ua1n8JAOCQR2hJQnccoevbeoaHsiIwp88IO3iMM42lS1jervUPa0Fi/sRmNagfqDMnh0
         /rhetrue58FSRFSbD107SD+e8L9oML8cokNhkEQOXo+RymQPLENsJg6gqBAB3yyD/g09
         H3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065186; x=1775669986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=tXVb3QcLviB4xwOoRs1ngV1MUkXj0cz7YL2LwruX5/PGtb5XswAFY2dVpPUbxqVrlD
         WCEPAOOfH4l8mzzxA+s45BsDeuA0EiLYwy/t5pufKd3Wu35xz3ffyXMZXZ415mBEkpjd
         m6TJBZ2TjgxWro/JJYs6RoX6SyHIfq87jmKLZdw0hvdisq63plR4tyUDyTxoatsXWtrO
         LtCcCLF4nQWtAAUnvxbEmQriLq98QUrnQxWXqNsNGF+/8nsN6ZKTRoocc9iL4asVzVPj
         Y88PSEq0I6xUQzv5STs5II8vZDoN2YoD9Q6z/gxyTWUJIG9brHS+4pnJT0m6BrJjsW8Y
         ScMg==
X-Forwarded-Encrypted: i=1; AJvYcCXpIN24w6slJBO8ORCi9zXSKKeookz24UIXC3nmP91FF4lByNV0xnQ9C1QUGIIVWLkuUCOGQWgmxw8b6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFxShn3Oha5N4pRVFTtuRkW1mr5Bk75Lw9aZvvU+6Ls0M+nuFN
	CrGKzBlZnrnyiQng4ArEontEMC7V44FEZGomAwelgqZFCPTJPA2K0VLcQCEIkcAI2X78+N9FCAr
	VjTsIiAzLFHrBVKz/1jYv0KlOuPDRMwo=
X-Gm-Gg: ATEYQzwA9jzoPgzgDZzWr4+34f5PI3yPiRJ7iNCPvmUOMnS6b0v8wRf+ZT1dZXMd7di
	r+zyM9mAwsOs5d4cCPiwznxR0CWpOWPrjlv7ICFCPK2KFoYqtPBD+Aq89qWgi1mdeEHxZClYwKd
	5uaN0XYShyaZEF7XURhF1p0+jf3hFaRN3Er+wYR4NNZQncXL+MsNTiYkT8ks3spje/WoWJvibK9
	prRMvfBVekFeSMAs22xgarPjpkVC5RBCqc9SD27PhYdt5mwg0+QXaC0fw3Q+Z1TLZ5Ri00IIYY8
	zS9VsHfrtiCFYCNuv41GA40iCq+aUbD8EdBCG1cxDRs3FYLYddmf07ksIWdxnZVh0n0iniWyDQp
	GfVA5/BIHDLa0ijz3HqIdY+KlGgrSIzPoYA==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround conditional
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_103947_714671_A2A1A40E 
X-CRM114-Status: GOOD (  10.74  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCA0OjA44oCvUE0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+Cj4gT2theSwgSSBzZWUgd2hhdCB0aGUgY29tbWVudHMgbWVhbiBub3cuIFBl
cmhhcHMgc3F1YXNoIHRoaXMgdG8gdGhlIHByZXZpb3VzCj4gY29tbWl0PwoKVGhpcyBvbmUgd2Fz
IG1vc3RseSB0byBlbnN1cmUgdGhlIHdvcmthcm91bmQgd2FzIG5vdCBuZWVkZWQgYW55bW9yZSwK
aS5lLiBpdCBpcyBtb3JlICJvcHRpb25hbCIgdGhhbiB0aGUgb3RoZXIuCgpJbiBmYWN0LCB3ZSBt
YXkgd2FudCB0byBqdXN0IG5vdCBoYXZlIG5laXRoZXIgb2YgdGhlIHBhdGNoZXMsIGkuZS4gd2UK
Y291bGQganVzdCByZW1vdmUgdGhlIHdvcmthcm91bmQgZ2l2ZW4gdGhlIHRpbWVsaW5lcyBvZiB0
aGUgYnJhbmNoZXMKLS0gcGxlYXNlIHNlZSBteSByZXBseSBvbiB0aGUgcHJldmlvdXMgb25lIG9u
IHRoaXMuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
