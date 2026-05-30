Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804C2CD5BD0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eV650EusVc0CNAapYrabGJtnbBsrclxfukeySxyhIRA=; b=RJeNH2EQqjZDkG
	FKjvlNQCLQRjbPsdCRpWlpN88YhLUrRK6mI23OrWvHLVOIfHSZ+7eC1E602K+UPPpnC6c0fTUojlQ
	uY2YqwFPVoHogx6ORLJa1kUKJoNY96zaGuFAK4KF/PNMWqFuPzyQeyAm88kJGilMSaZk2NUpwjvkB
	dvMh8iXjhG9E21//R6dW2cJObM/1oxLApqBwpdCPJymI0GgUqbYrUUZz2IFA02pPcXxTL8AlM7dUk
	FuaeuaMHfTtjjFBWwy+oWuKimjeDaU6pF6lKYQ7Q9PoYCDpwJ2MAJWoIXinMlBdCZ3gF7jRInCUCQ
	4swyixKYgtpUOojDqfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPY9-000000091uz-0PRg;
	Sat, 30 May 2026 19:40:49 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPY6-000000091ub-1Cgh
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 19:40:47 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7e2fd65f968so822367b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 12:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780170045; cv=none;
        d=google.com; s=arc-20240605;
        b=b8io2bSL1qitfdkIq0ngYNO96W8RKvv4U7vpal4GxLlyBkSUDDb/FbbosYsIGCOvBi
         ZlG2OWPSXT3CE8rtKzsYoQt+j+OzB66UzgQmOyv0+RIUDLtfcWxqxss1KKPMRQiYvEzy
         jMx56BzGo/y+Dz2jfOaq90He+nD9218Qnf6BaZyTxr0/GZ+PvboJCtv8pzyvXWdAeToF
         aLwENcoATNKzba6zmMcJSP+QUjB2jZssiFFdYo6hx8N86awXOjwMtdeLrkUos07hHFmh
         yt7vi+TWS8cwW+TCX0q+caSd485VU/CI6qCbNWZrWWeTgLAkMTmMhL6asjImMG8bsxUO
         ni3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZhMPXpo5C9bO9KiY6ITYmWYOylh8Rc870xEi824FVCY=;
        fh=WQVcu2xJP2cCcGUpI2AY4OJ0lCkJWUQteHoMtoxcIPU=;
        b=XCRV+/jHOBcLLj4QgzoAl0xQL1ql0q1xAjkTO0aW+FIu8NjekWicv8rB9dAi1BpsXt
         lxbQs2CH++SyoJ9gjQdM9F30wLGpXsursRakXvr8kgUNvT7rJp76WPcIfrKm0Xh66MEp
         HiH3f4NigvkvVVmWXthHe4MqckwsZsVC9MKbvQfFpORw6YEfVjdV8/zmJYArqrqYowlw
         lYJLFLolqoqjqOpzdR0Yoc0cQ3RpEsEMWP71Ilfp+vBnepK+34KCHJci3tggLn2XJbpZ
         mMZCxRWmt8XayMyBreIVfyk0zWSMw07EqwSljaq8uh/SSZOxw83Pumjbx3rH8wBs1XTW
         58aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780170045; x=1780774845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhMPXpo5C9bO9KiY6ITYmWYOylh8Rc870xEi824FVCY=;
        b=Mu014HD/AmbPrYFOHm09KTP3iDO5z1pRJSMbGEoKHDZvBa9CY2FD7tXJHujoMmL/ts
         t6PqcZOY6asskZ8V18WkrGQmP+BCxBR6p7qOLDIirZOkclLVMgF+Q7nPC/LZMQucNMo1
         aftBIOlyjnenkoEHXztrfFqiXflpiXgTYo/tyguyJpy+67B2YBHYh2OWTrVy05oEGw5r
         Hosfz0j2gFoMBTO8Zv5Wp25f6NVetdPBR3DDuhoR9Y2Hzj+mzPO92gOMw1Z3PEMxtDmF
         kNYcjEN6caOsmaGtsVSdE7bB5M998FHmOHRR+GpY8BLjcM4o8/1+rJ942dsAhsdElPiy
         kIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170045; x=1780774845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhMPXpo5C9bO9KiY6ITYmWYOylh8Rc870xEi824FVCY=;
        b=VxKvwqPpW3eIMS2xnk6opSQLHWDZUXdF40ByXdew9EvPd35HJrgbuJpan29rO1Xchi
         rLlC6KCrBcM8m4nK6ww8qP3Ot/ChOWIc/fwmL+LQXVZsFp3nak6me6pNeDI+xlrx/Wu3
         YgKII65ndFp3wBXxSrcrBhBSG/ykFfQ5dSUL7vAOy/KhSCb14o8o/yHXxhystIwmuXDT
         kTrZ7deiLPUyGfTKPDDkrWo7sUst2QuD8vhryKHhw4SoG5Wviu/DwDnMw4lMzXE4Uu+T
         tDwuNWeUDKS6Is6n94xeLyTDqDN0K039x/7b7yDASyBdRBv4rmYUNmDBzdZGer2jJmfI
         xDZA==
X-Forwarded-Encrypted: i=1; AFNElJ+VKKLQAocAWoZfdwgPWTL3vPEfwHdlCqyZG1IhGIT2tHglSENJxzEGj0Qb1n9SGwqOjXdpHF1frN/bdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJuAyFEMpE3KEU8N7g7mr5NB+R85W8iJQpA+JVPdla9zRWVyTf
	miFQa8I+3a10R86Kt0nr/4gMEWUB7kY0BV8e49f6DTfzpv3UbN/oOno7l097xQEyuIoNqRs7b1T
	KNDYRpSV6BT1qC0kr8JxSBBDKJ9NaPhzeUlpXtrUagg==
X-Gm-Gg: Acq92OE4FczXE6RpgJA7P4A3FTpEnTRSnaAXI8u53caWBgMl+0GLI/TKQhkf/CkdHJa
	n+/HXwtgo7Hs9J9+t7cgbPVTAg2Eu94mAugoy9jBEzfkpQejXGCpbKiQcPJgdStT1m9EOmCkXj7
	OHx6nMQEYLZNo4GMsdvM/DhNgw55HpEvMZ/Iznj0Mkue1+BQpeJPymjJuVPqNmqQKnXOk1DPQl/
	wxmP6t4GDErJmomdCXSxfyHMjqBS8lz+FMKkwsN9Jhkyr9BH8b0OCTnaDi6qnanVTj/P9Tf9xzE
	DigFZcsEIxGhLtPYZ+psRVJkSAy1qy4p1bZ13c/nciXTnuEVtrA=
X-Received: by 2002:a05:690c:f04:b0:7b2:513b:34d7 with SMTP id
 00721157ae682-7e05c664b30mr45779587b3.29.1780170044578; Sat, 30 May 2026
 12:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com> <87jyslndo4.fsf@igel.home>
In-Reply-To: <87jyslndo4.fsf@igel.home>
From: Deepak Gupta <debug@rivosinc.com>
Date: Sat, 30 May 2026 12:40:33 -0700
X-Gm-Features: AVHnY4L_dtmKXZYG4oLZDjuNSTdF7bCgCYfC8yAIbkNUuu6y-j26ASIyCiMoR50
Message-ID: <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
X-CRM114-CacheID: sfid-20260530_124046_424499_80DA5CB7 
X-CRM114-Status: GOOD (  16.76  )
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

T24gU2F0LCBNYXkgMzAsIDIwMjYgYXQgODowMuKAr0FNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gT24gTm92IDEyIDIwMjUsIERlZXBhayBHdXB0YSB2
aWEgQjQgUmVsYXkgd3JvdGU6Cj4KPiA+IEZyb206IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3Np
bmMuY29tPgo+ID4KPiA+IGBhcmNoX2NhbGNfdm1fcHJvdF9iaXRzYCBpcyBpbXBsZW1lbnRlZCBv
biByaXNjLXYgdG8gcmV0dXJuIFZNX1JFQUQgfAo+ID4gVk1fV1JJVEUgaWYgUFJPVF9XUklURSBp
cyBzcGVjaWZpZWQuIFNpbWlsYXJseSBgcmlzY3Zfc3lzX21tYXBgIGlzCj4gPiB1cGRhdGVkIHRv
IGNvbnZlcnQgYWxsIGluY29taW5nIFBST1RfV1JJVEUgdG8gKFBST1RfV1JJVEUgfCBQUk9UX1JF
QUQpLgo+ID4gVGhpcyBpcyB0byBtYWtlIHN1cmUgdGhhdCBhbnkgZXhpc3RpbmcgYXBwcyB1c2lu
ZyBQUk9UX1dSSVRFIHN0aWxsIHdvcmsuCj4gPgo+ID4gRWFybGllciBgcHJvdGVjdGlvbl9tYXBb
Vk1fV1JJVEVdYCB1c2VkIHRvIHBpY2sgcmVhZC13cml0ZSBQVEUgZW5jb2RpbmdzLgo+ID4gTm93
IGBwcm90ZWN0aW9uX21hcFtWTV9XUklURV1gIHdpbGwgYWx3YXlzIHBpY2sgUEFHRV9TSEFET1dT
VEFDSyBQVEUKPiA+IGVuY29kaW5ncyBmb3Igc2hhZG93IHN0YWNrLiBBYm92ZSBjaGFuZ2VzIGVu
c3VyZSB0aGF0IGV4aXN0aW5nIGFwcHMKPiA+IGNvbnRpbnVlIHRvIHdvcmsgYmVjYXVzZSB1bmRl
cm5lYXRoIGtlcm5lbCB3aWxsIGJlIHBpY2tpbmcKPiA+IGBwcm90ZWN0aW9uX21hcFtWTV9XUklU
RXxWTV9SRUFEXWAgUFRFIGVuY29kaW5ncy4KPgo+IFRoaXMgYnJlYWtzIExUUCBtbWFwMDQ6Cj4K
PiAkIC4vbW1hcDA0Cj4gdHN0X3Rlc3QuYzoyMDQyOiBUSU5GTzogTFRQIHZlcnNpb246IDIwMjYw
NTI5LjVjY2Y4MTZmCj4gdHN0X3Rlc3QuYzoyMDQ1OiBUSU5GTzogVGVzdGVkIGtlcm5lbDogNy4w
LjEwLTUtZGVmYXVsdCAjMSBTTVAgUFJFRU1QVF9EWU5BTUlDIFNhdCBNYXkgMjMgMTI6MDk6MDkg
VVRDIDIwMjYgKGJiOTU1ODkpIHJpc2N2NjQKPiB0c3Rfa2NvbmZpZy5jOjkwOiBUSU5GTzogUGFy
c2luZyBrZXJuZWwgY29uZmlnICcvcHJvYy9jb25maWcuZ3onCj4gdHN0X2tjb25maWcuYzo3NTM6
IFRJTkZPOiBDT05GSUdfRkFVTFRfSU5KRUNUSU9OIGtlcm5lbCBvcHRpb24gZGV0ZWN0ZWQgd2hp
Y2ggbWlnaHQgc2xvdyB0aGUgZXhlY3V0aW9uCj4gdHN0X3Rlc3QuYzoxODcwOiBUSU5GTzogT3Zl
cmFsbCB0aW1lb3V0IHBlciBydW4gaXMgMGggMDRtIDAwcwo+IG1tYXAwNC5jOjY2OiBUUEFTUzog
bWFwcGluZyBwZXJtaXNzaW9ucyBpbiAvcHJvYyBtYXRjaGVkOiAtLS1wCj4gbW1hcDA0LmM6NjY6
IFRQQVNTOiBtYXBwaW5nIHBlcm1pc3Npb25zIGluIC9wcm9jIG1hdGNoZWQ6IC0tLXMKPiBtbWFw
MDQuYzo2NjogVFBBU1M6IG1hcHBpbmcgcGVybWlzc2lvbnMgaW4gL3Byb2MgbWF0Y2hlZDogci0t
cAo+IG1tYXAwNC5jOjY2OiBUUEFTUzogbWFwcGluZyBwZXJtaXNzaW9ucyBpbiAvcHJvYyBtYXRj
aGVkOiByLS1zCj4gbW1hcDA0LmM6Njg6IFRGQUlMOiBtYXBwaW5nIHBlcm1pc3Npb25zIGluIC9w
cm9jIG1pc21hdGNoZWQsIGV4cGVjdGVkOiAtdy1wLCBmb3VuZDogcnctcAo+IG1tYXAwNC5jOjY4
OiBURkFJTDogbWFwcGluZyBwZXJtaXNzaW9ucyBpbiAvcHJvYyBtaXNtYXRjaGVkLCBleHBlY3Rl
ZDogLXctcywgZm91bmQ6IHJ3LXMKPiBtbWFwMDQuYzo2NjogVFBBU1M6IG1hcHBpbmcgcGVybWlz
c2lvbnMgaW4gL3Byb2MgbWF0Y2hlZDogcnctcAo+IG1tYXAwNC5jOjY2OiBUUEFTUzogbWFwcGlu
ZyBwZXJtaXNzaW9ucyBpbiAvcHJvYyBtYXRjaGVkOiBydy1zCj4gbW1hcDA0LmM6NjY6IFRQQVNT
OiBtYXBwaW5nIHBlcm1pc3Npb25zIGluIC9wcm9jIG1hdGNoZWQ6IHIteHAKPiBtbWFwMDQuYzo2
NjogVFBBU1M6IG1hcHBpbmcgcGVybWlzc2lvbnMgaW4gL3Byb2MgbWF0Y2hlZDogci14cwo+IG1t
YXAwNC5jOjY4OiBURkFJTDogbWFwcGluZyBwZXJtaXNzaW9ucyBpbiAvcHJvYyBtaXNtYXRjaGVk
LCBleHBlY3RlZDogLXd4cCwgZm91bmQ6IHJ3eHAKPiBtbWFwMDQuYzo2ODogVEZBSUw6IG1hcHBp
bmcgcGVybWlzc2lvbnMgaW4gL3Byb2MgbWlzbWF0Y2hlZCwgZXhwZWN0ZWQ6IC13eHMsIGZvdW5k
OiByd3hzCj4gbW1hcDA0LmM6NjY6IFRQQVNTOiBtYXBwaW5nIHBlcm1pc3Npb25zIGluIC9wcm9j
IG1hdGNoZWQ6IHJ3eHAKPiBtbWFwMDQuYzo2NjogVFBBU1M6IG1hcHBpbmcgcGVybWlzc2lvbnMg
aW4gL3Byb2MgbWF0Y2hlZDogcnd4cwoKQnV0IHdoYXQgZG9lcyBhIHdyaXRhYmxlIG9ubHkgbWFw
cGluZyBldmVuIG1lYW4/IEl0IGNhbiBhbHdheXMgYmUgcmVhZC4KSSBzZWUgdHdvIHdheXMgZm9y
d2FyZDoKCi0gSXQgY2FuIGJlIGRvbmUgaW4gZ2VuZXJpYyB3YXkgd2hlcmUgaW5jb21pbmcgUFJP
VF9XUklURSBtZWFucwogIFBST1RfUkVBRCB8IFBST1RfV1JJVEUgaXJyZXNwZWN0aXZlIG9mIFJJ
U0MtVi4gQWx0aG91Z2ggb3RoZXJzCiAgKHg4NiwgYXJtLCBldGMpIHdvdWxkIGhhdmUgdG8gd2Vp
Z2ggaW4uCgpPUgoKLSBtbWFwMDQgTFRQIHRlc3QgY2FuIGJlIHVwZGF0ZWQgdG8gZXhwZWN0IGVp
dGhlciBvZiAicnctcCIgb3IgIi13LXAiCiAgd2hlbmV2ZXIgb25seSBQUk9UX1dSSVRFIHdhcyBz
cGVjaWZpZWQuCgpJIHRoaW5rIGxhdHRlciAodXBkYXRpbmcgbW1hcDA0IHRlc3QpIGlzIHRoZSBl
YXNpZXIgcGF0aC4KCj4KPiBTdW1tYXJ5Ogo+IHBhc3NlZCAgIDEwCj4gZmFpbGVkICAgNAo+IGJy
b2tlbiAgIDAKPiBza2lwcGVkICAwCj4gd2FybmluZ3MgMAo+Cj4gLS0KPiBBbmRyZWFzIFNjaHdh
Yiwgc2Nod2FiQGxpbnV4LW02OGsub3JnCj4gR1BHIEtleSBmaW5nZXJwcmludCA9IDc1NzggRUI0
NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjczIEU3ODAgQTlEQSBBRUMxCj4gIkFuZCBub3cgZm9y
IHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
