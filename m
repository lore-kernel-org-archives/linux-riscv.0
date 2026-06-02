Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABEECD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50xYe+bhVvWVXf08PYWv3MM1etHQJBqQUOxvTgQdfqY=; b=FJ6XiMtrUpIsy6
	13I2+UIoyfq9DOSAJCP69Ie91oNATiNlc5ppXHj3WT/OvUtWqqtAlRMv2K4/8f6Y93MfJ35qWP8RV
	uNAn0blrtXA9MZ4n4ak8A1hbMzTzFrYS0b1lsw6n23yFJr9LgKA4qbFC+s3ypfCWuHMcyot95smbt
	r3rBZaMZDfyRfqOG58/vtXxE5O4X8eA65Y8jLZUT0GeIJ/VhkSUWTvvp5JIl45boASMpzhXJPl5nw
	UXzeKzyDfT1quf39UKXUg8YPZYH4vJ/SK4/elBX1zJCdf1ls/5mTAqkBiPtwx2KTOZxzwy66ysot7
	gIIR/zUaqA9k4kwH6VRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURqX-0000000DQCY-2uNI;
	Tue, 02 Jun 2026 16:20:05 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURqV-0000000DQBp-0yHA
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 16:20:04 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66058b880e9so4135191d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 09:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780417202; cv=none;
        d=google.com; s=arc-20240605;
        b=d28YKXb5ywfnUiG6Y94YcGO6n5XtKHJBwLxvSAhuTeHTUogy7QG8O4QXAhVwhbFqkk
         I+HM7VzO1X2lTOGEsYp/WzQi6pe+ekEwan2FuB2L7wgOh3TUQjBqQhmGEIVD29LomGce
         N5iKBnOzhvvdZB0LeFUHbOzfOw0dOFAGXncR7kteYFDnndx/jpe/FXWEykN7wIfIY/MO
         cM6EBduqxvL1HHx1yn0cI3IsW5vJ32XxyxCEv62bkdCaVpScvhwggzQuwYq7mstNrZOu
         HhTHCS4hWsw32wPOTIbChztCZnqR9NmMBdEg6vOeCjDiHplfcO8VmrIgERg4hWy21+RB
         dIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        fh=2B/5bTollgFi5KS6XUuXSaiqfSYVNk0HgWbExMSH7zY=;
        b=VHihVgz3Tg4XFAys142S5xdwxKWL1WaXBmUvR8Yn232kW08h4cy41/V1Qx7rUiKCgE
         SuDe9VKG5pOEe2SgFyKg8MAjGzHbWdkPJ8fzzgEsGLQqy+ArP+ufMraW/vgMZ6jfe17U
         r+Tu8e4biSNN2ag/T0vB6HTYAwCmQdwd35u8PE807lRO42uJS/9zd9Qda+T5JFQXH5Hy
         0KvC5JIEKYuJzxczII1R+LVtOx5t8wxOk2OaUcRcUyeZxORBo5LUZwECTqL+ZPipgyT+
         wKpZwrEmbgcv+DkIRNOjjFBK+Fnavq+fNyDMxtQSge8TOjmUAHLyG1gcrC3++XwScA5k
         WCug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780417202; x=1781022002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        b=BZN0+o1ANYU5MVkuCLT1w1G4q3orDuZLzW1EREQxrO+S7DaJR6KRD5699M32WHAoKc
         kff6u5k6jahm6xZ4SDT1fbZl2O8CBaRD19mjHcJyJQaxk2yHIrAJWbgIx2QAPqRabIqd
         /Jp53GsW9wRHfXQPdgiZHkFB6Eu4z7TvXMI8KJQP8s5kfuoCbCc3xoU2NC3rYPUcgY1H
         8UhzHfWdU1jEFXhwPfG4HvR0dgyxEJcwRNSN6dLPszqS9wTEfHX6I4hE9kR6D+x7e+4Q
         xHq28EDwMJD0oDAsuYSHAE3v0qtzM533EeSO7Nbh5JHNqfz4n0zhWdy9qXps99+do9qF
         qu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780417202; x=1781022002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        b=MT18gW2JMH26FAmPpPbm95J0JQSXEXTYzL/KkW7FVsrr1IaYIuTGfxE+UivcYz+Vkg
         tCO+LoztZNZoG4CxEfdlWtdwu9NNXL8YEVdL8ZTns2ujjdNpvqhaIdCB6VVMwgP2etRh
         bSq60GfqFowNP1Go36/AnAHdSbfmQRzILRRibgxD1oVvHXgKXzy/xIySimxu12EYT6IE
         Cqm2I+e3mExGSjxgLNMsnSOatRrOg7prnDWti1XR7nmBMZJLa2hiamZt3fySvxC1stDA
         FrzNcHBMk4AAYLWz0DTwrgH+sQxhBRXInPdA3bPdTazLFWhvrCZi6WNIJ5kok9zmnRMK
         eUUw==
X-Forwarded-Encrypted: i=1; AFNElJ8LmyWGwSSTMMNAef9m9UzFOgKq+GYUPFfnW/lrT+wfiBUpoW+5caN+khNQzBEyocd9kjjJvSSSnsc0Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDiT5yz7ulehUVzh7K4L5MUU8S7qFIx2Dd8H9095ezWOywQGLE
	DpBtnOawRnNBLW25hFoiJhzVIy/KJ9E9aGA8q2kaVChCULiGdFvjnY6JoJxMVkuymf792HgmTSp
	hziMwc96YX+ZnJHPO62qXJlQssJur/v/7d1eWywsz2g==
X-Gm-Gg: Acq92OEe6zjkbQUlz1j3C/oLMkhXe1N1S6d6nqkGjbTGp+Q3xTvmng5rCKgOmAMziTI
	rSRE9uFEaZpVM0U4uvFLnFlPD3zQ+54sDH8EGNAeXld+DzC+aJdvnmrM4833BYnGs5l6448/dxo
	qf+27f6QXUuRluSKXZsH1RcW1tCO9Od8BKJcL82uSTUXIZI/wII53maji2RnTnUtDrObmzwH4C9
	4xcezex6ZwE3TfyDp8gIO2ymw2c4ZrTzht0Pr//RuYN10b5Y2ouVClGUdxf2K9OYyAj0QYz4Pge
	ZKw81BAXCyRNdoGJc1ia7GWqbS3toJneZA==
X-Received: by 2002:a05:690e:23c7:b0:660:367d:539c with SMTP id
 956f58d0204a3-660d61a5f90mr366583d50.65.1780417201973; Tue, 02 Jun 2026
 09:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home> <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
 <871peqgp9v.fsf@igel.home> <CAKC1njR+dTdvp+BmLGPtgd8dufiUwBtkQ9a-qinELT_Fmi13sQ@mail.gmail.com>
 <87wlwif04z.fsf@igel.home> <87tsrli6lt.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87tsrli6lt.fsf@email.froward.int.ebiederm.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 2 Jun 2026 09:19:50 -0700
X-Gm-Features: AVHnY4LGzvAggFLA4mHNoi-t9ivcZhZK65HitG7Axu1HWjT50Q9msXqH7dSmtzU
Message-ID: <CAKC1njRapOxS6ibQdCuES1E3aAjsA+yGz4yZ1xJAZHU2vkAm_A@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, 
	Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_092003_350190_335AAE68 
X-CRM114-Status: GOOD (  25.78  )
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

T24gVHVlLCBKdW4gMiwgMjAyNiBhdCAzOjIz4oCvQU0gRXJpYyBXLiBCaWVkZXJtYW4gPGViaWVk
ZXJtQHhtaXNzaW9uLmNvbT4gd3JvdGU6Cj4KPiBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxpbnV4
LW02OGsub3JnPiB3cml0ZXM6Cj4KPiA+IE9uIEp1biAwMSAyMDI2LCBEZWVwYWsgR3VwdGEgd3Jv
dGU6Cj4gPgo+ID4+IHJpc2N2IHVzZXMgYFZNX1NIQURPV19TVEFDS2AuIEl0J3MganVzdCB2ZXJ5
IHNpbXBsZSB0byB1c2UgYHByb3RlY3Rpb25fbWFwYAo+ID4+IHdpdGgganVzdCBgVk1fV1JJVEVg
LiBPbiBSSVNDLVYsIGAtVy1gIGlzIGEgc2hhZG93IHN0YWNrIG1hcHBpbmcuIEl0J3Mgbm90IHNh
bWUKPiA+PiBvbiB4ODYgb3IgYXJtNjQuIFNvIGBwcm90ZWN0aW9uX21hcFtWTV9XUklURV1gIHNp
bXBseSBwaWNrcyBzaGFkb3cgc3RhY2sKPiA+PiBlbmNvZGluZy4gV2UganVzdCBlbnN1cmUgdGhh
dCBQUk9UX1dSSVRFIGlzIGNvbnZlcnRlZCB0bwo+ID4+ICJWTV9SRUFEIHwgVk1fV1JJVEUiIGF0
IHZtYSBsZXZlbC4KPiA+Cj4gPiBUaGF0IGRvZXMgbm90IGV4cGxhaW4gX3doeV8geW91IG5lZWQg
dG8gbWFrZSB0aGF0IHVzZXIgdmlzaWJsZSBjaGFuZ2UsCj4gPiB3aGVuIG90aGVycyBjYW4gZ2V0
IGF3YXkgd2l0aG91dCBpdC4KPgo+IEVzcGVjaWFsbHkgc2luY2UgYXMgSSByZWNhbGwgdGhlIGRl
Y2lzaW9uIHdhcyBtYWRlIHdhcyB0aGF0IHRoZSB1c2VyCj4gdmlzaWJsZSBwcm90ZWN0aW9uIGJp
dHMgd291bGQgbWF0Y2ggdGhlIG1tYXAgY2FsbC4gIElmIHRoZXJlIGlzIHNvbWUKPiBjb21iaW5h
dGlvbiBhbiBhcmNoaXRlY3R1cmUgZG9lcyBub3Qgc3VwcG9ydCB0aGF0IHdvdWxkIHNpbXBseSBu
b3QgYmUKPiByZWZsZWN0ZWQgaW4gaGFyZHdhcmUgdW50aWwgc29tZSBmdXR1cmUgdmVyc2lvbiBv
ZiB0aGUgaGFyZHdhcmUgZ2V0cwo+IGFyb3VuZCB0byBzdXBwb3J0aW5nIGl0Lgo+Cj4gVGhpcyBp
cyB3aGF0IGhhcHBlbmVkIHdpdGggZXhlY3V0YWJsZSBwYWdlIHBlcm1pc3Npb25zIG9uIHg4NiBm
b3IKPiBleGFtcGxlLiAgSXQgdXNlZCB0byBiZSB0aGF0IGl0IHdhcyBub3QgcG9zc2libGUgdG8g
ZGVueSBleGVjdXRlCj4gcGVybWlzc2lvbiBvbiBhIHJlYWRhYmxlIHBhZ2UuICBMYXRlciB0aGF0
IHByb3ZlZCBzdWZmaWNpZW50bHkgdmFsdWFibGUKPiB0aGF0IHN1cHBvcnQgZm9yIGRlbnlpbmcg
ZXhlY3V0ZSBwZXJtaXNzaW9uIHdhcyBhZGRlZCB0byB0aGUgaGFyZHdhcmUuCj4KPiBUaGF0IGFs
bCBoYXBwZW5lZCBxdWl0ZSB0cmFuc3BhcmVudGx5IHRvIHVzZXJzcGFjZSwgdGhhdCB3YXNuJ3Qg
dHJ5aW5nCj4gdG8gYXNzdW1pbmcgUFJPVF9SRUFEIGltcGxpZWQgUFJPVF9FWEVDLgo+Cj4gU28g
SSBhbSBhdCBhIGNvbXBsZXRlIGxvc3Mgd2h5IHNvbWVvbmUgd291bGQgY2hvb3NlIHRvIGJyZWFr
IHVzZXJzcGFjZQo+IGJ5IGNvbmZ1c2luZyBoYXJkd2FyZSBsaW1pdGF0aW9ucyB3aXRoIHdoYXQg
dXNlcnNwYWNlIGFza3MgZm9yIGluIG1tYXAuCgpJbml0aWFsbHkgbXkgcGxhbiB3YXMgdG8gcmUt
dXNlIChvbmx5KSBWTV9XUklURSBhcyAoYWxpYXMgdG8pIFZNX1NIQURPV19TVEFDSwpvbiByaXNj
LXYgdG8gbWF0Y2ggaGFyZHdhcmUgV3JpdGUtb25seSBQVEUgZW5jb2RpbmcgYW5kIEkgZGlkbid0
IHNlZQphbnkgb3Bwb3NpdGlvbgp0byB0aGF0IGluaXRpYWxseS4gVW50aWwgbGF0ZXIgd2hlbiBp
dCB3YXMgc3VnZ2VzdGVkIHRvICB1c2UgZGlzdGluY3QKVk1fU0hBRE9XX1NUQUNLCmVuY29kaW5n
LgpBbHRob3VnaCB0aGVyZSB3YXNuJ3QgYW55IG9wcG9zdGlvbiB0byB0aGlzIHBhdGNoLCBzZWVt
cyBsaWtlIGl0IG1hZGUgaXQgaW4uCgpOb3cgdGhhdCBJIHRha2UgYSBsb29rIGF0IGl0LCBJIHRo
aW5rIGl0IGNhbiBiZSBtYWRlIHRvIHdvcmsuIFNvcnJ5IGFib3V0IHRoYXQuCgpOb3cgdGhhdCBJ
IGhhdmUgc3dpdGNoZWQgbXkgYWZmaWxpYXRpb24gdG8gbWV0YSwgSSdsbCBoYXZlIHRvIHNwZW5k
CnNvbWUgdGltZSB0byBzZXQKdXAgcmlzYy12IGRldiBlbnZpcm9ubWVudC4KCkknbGwgc2VuZCBh
IHBhdGNoLiBUaGFua3MuCgo+Cj4gRXJpYwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
