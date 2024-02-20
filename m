Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E02C48BF8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 02:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N2QzOVCykXOWfjlhZhhMIrF7tzav/9Fuk7IBu3+iUuo=; b=VJjOwPBTb4Q+eMMmDeImDK9IuL
	IFekHendea1W8VEB4hNcbfHTB2p9B9ObgEVDPSeYj3PRMULt7v8un47PucZq8fovyExrBxuzG9DRE
	8WvNzk3aIFeBYWRcsgGhC28MTy8ls3+FKJxGiLzJ1LJzlICbicEg5PF+7DdNTpTIAPQpIdUdk3/fb
	SdIODCLg5gTuPofB6cI7tNZP//FB+Me+4tf19rNfUcfTW4Tgz+c3LLZSGMr0X3eNamsW1roek7ltw
	VRHULIW34cb1aOxwoionQQmPtD8kaPqrQy8qDX9eZ0ILbtWX3FqNyHAsSSzuekKDBw9kWClgi/qV5
	Jt43g0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFfu-0000000Cq4I-47gK;
	Tue, 20 Feb 2024 02:16:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFfs-0000000Cq3V-3mBw
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 02:16:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dbd32cff0bso16164225ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 18:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708395360; x=1709000160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OAN0Lt5ZKU5YCY2zjENEtHOA9Ppd3OvNfkI0wLPm9E=;
        b=i9GmEMBggBMtlxG8G0mAAGsIRC014dI1wUnw1EWol8wm0m6gfpZhcK7Xn1EVL2Hla6
         JxfAjDeG0qD/xb6tMGYZ15mQZkfcYxxRcjtvzjahctRyvtCN7utO3KdX9piF04F7aLaf
         8GLlrzjwZ/2en7TZpPFKvV6RWmcY0svNljHVVHRMPammkcPSyMDERS3HFN8cSgPX8dJn
         JWPuF7ORt+cmgDjvi2pLZYBl2twfBqM4LzPgymg2ufxSNjnW6eu4/Rd4vgCi5X7aDbLs
         pMNcM7lLiHlnXkZevFHnbRi+jwcC35Qhpf24wnq5uz0551+whiqf/eftHk8DZgJjjE4W
         qroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708395360; x=1709000160;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OAN0Lt5ZKU5YCY2zjENEtHOA9Ppd3OvNfkI0wLPm9E=;
        b=JYcjpxpsXxs03e2dlsBGRwO4gdKpQ519/M8H9oCcbVZ0Opu27odEGL85TYNA8NhDLi
         Yq9Xtivsko/BMvUkn8HdbhOL0U80nbV5T5QJQf7Er/6JqC+T3bx6LCOEXYnH+sFjdWSc
         NV/uiGXnGGK1qj47pGmo4SnDNSxSxyrzhQk72I3MBRlyq+g3F6IKXTLn5c+kUoDiYjrx
         6Sz+A90PCly8LIrTT23i3Y4PHONAIJ7cz9iVKgGo02K4zFX2Ch8YjjWHjadHVuyMTd/s
         vOZ9EWRxm8LiMSVuZXJ0hx9ZznYNhK1ugBk6GcfpmZ4/mF+ATf9IA74kPv5jMzarHv4R
         cMkg==
X-Forwarded-Encrypted: i=1; AJvYcCVdX4qe56xKtnGHBZh2bNLD4cRETPqQv1wzi8jLFPOccK0Hjr0sm3mUQb6axqIS6ivqkYwU8m2ev7vCUiOJQjl3GzV76EmHW/06t2iZZK96
X-Gm-Message-State: AOJu0Yz5fNV2EGIoUnnF/F+YCOEglZDdSYDJ2JpGL90LVjvKKX8l8xks
	dd0mkKeykW53uS+WZ90wZA7cpCNjy2QBypLRbOdu06np1tVRQSjKyD+pXicUgWc=
X-Google-Smtp-Source: AGHT+IE/HK82k8jF0QyDP8MRiJTDcRIUH+5Nn34RcteS7Lvc7xDUJSIleyKlVy8K/rQ9hjc5E9YxbQ==
X-Received: by 2002:a17:902:ea0d:b0:1db:e7a4:90a8 with SMTP id s13-20020a170902ea0d00b001dbe7a490a8mr6006330plg.10.1708395359755;
        Mon, 19 Feb 2024 18:15:59 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a328:9cae:8aed:4821])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001db3efca159sm5042143plg.132.2024.02.19.18.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 18:15:59 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 33/38] kselftest/arm64: Add a GCS test program built
 with the system libc
In-reply-to: <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
Date: Mon, 19 Feb 2024 23:15:57 -0300
Message-ID: <87sf1n7uea.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_181600_980122_7E7E26BE 
X-CRM114-Status: GOOD (  16.77  )
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

Ck1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBUaGVyZSBhcmUgdGhp
bmdzIGxpa2UgdGhyZWFkcyB3aGljaCBub2xpYmMgc3RydWdnbGVzIHdpdGggd2hpY2ggd2Ugd2Fu
dAo+IHRvIGFkZCBjb3ZlcmFnZSBmb3IsIGFuZCB0aGUgQUJJIGFsbG93cyB1cyB0byB0ZXN0IG1v
c3Qgb2YgdGhlc2UgZXZlbiBpZgo+IGxpYmMgaXRzZWxmIGRvZXMgbm90IHVuZGVyc3RhbmQgR0NT
IHNvIGFkZCBhIHRlc3QgYXBwbGljYXRpb24gYnVpbHQKPiB1c2luZyB0aGUgc3lzdGVtIGxpYmMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L2djcy8uZ2l0aWdub3JlIHwgICAxICsK
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvZ2NzL01ha2VmaWxlICAgfCAgIDQgKy0K
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvZ2NzL2djcy11dGlsLmggfCAgMTAgKwo+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9nY3MvbGliYy1nY3MuYyB8IDczNiArKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA3NTAgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKSW4gdjcsIHNldmVyYWwgdGVzdHMgd2VyZW4ndCBydW5uaW5n
IGluIG15IEZWVCBWTSBmb3Igc29tZSByZWFzb24uClRoaXMgdGltZSB0aGV5IGRvOgoKJCAuL3J1
bl9rc2VsZnRlc3Quc2ggLXQgYXJtNjQ6bGliYy1nY3MKVEFQIHZlcnNpb24gMTMKMS4uMQojIHRp
bWVvdXQgc2V0IHRvIDQ1CiMgc2VsZnRlc3RzOiBhcm02NDogbGliYy1nY3MKIyBUQVAgdmVyc2lv
biAxMwojIDEuLjExOAojICMgU3RhcnRpbmcgMTE4IHRlc3RzIGZyb20gMzIgdGVzdCBjYXNlcy4K
IyAjICBSVU4gICAgICAgICAgIGdsb2JhbC5jYW5fY2FsbF9mdW5jdGlvbiAuLi4KIyAjIGNhbl9j
YWxsX2Z1bmN0aW9uOiBUZXN0IHRlcm1pbmF0ZWQgdW5leHBlY3RlZGx5IGJ5IHNpZ25hbCAxMQoj
ICMgICAgICAgICAgRkFJTCAgZ2xvYmFsLmNhbl9jYWxsX2Z1bmN0aW9uCiMgbm90IG9rIDEgZ2xv
YmFsLmNhbl9jYWxsX2Z1bmN0aW9uCiMgIyAgUlVOICAgICAgICAgICBnbG9iYWwuZ2NzX2VuYWJs
ZWRfdGhyZWFkIC4uLgojICMgICAgICAgICAgICBPSyAgZ2xvYmFsLmdjc19lbmFibGVkX3RocmVh
ZAojIG9rIDIgZ2xvYmFsLmdjc19lbmFibGVkX3RocmVhZAogICDii64KIyAjICBSVU4gICAgICAg
ICAgIGludmFsaWRfbXByb3RlY3QuZXhlY19idGkuZG9fbWFwX3JlYWQgLi4uCiMgIyBBbGxvY2F0
ZWQgc3RhY2sgZnJvbSAweGZmZmZiM2FhOTAwMC0weGZmZmZiM2FhYTAwMAojICMgICAgICAgICAg
ICBPSyAgaW52YWxpZF9tcHJvdGVjdC5leGVjX2J0aS5kb19tYXBfcmVhZAojIG9rIDExOCBpbnZh
bGlkX21wcm90ZWN0LmV4ZWNfYnRpLmRvX21hcF9yZWFkCiMgIyBGQUlMRUQ6IDExNyAvIDExOCB0
ZXN0cyBwYXNzZWQuCiMgIyBUb3RhbHM6IHBhc3M6MTE3IGZhaWw6MSB4ZmFpbDowIHhwYXNzOjAg
c2tpcDowIGVycm9yOjAKbm90IG9rIDEgc2VsZnRlc3RzOiBhcm02NDogbGliYy1nY3MgIyBleGl0
PTEKClRoZSBvbmx5IGlzc3VlIGFzIGNhbiBiZSBzZWVuIGFib3ZlIGlzIHRoYXQgdGhlIGNhbl9j
YWxsX2Z1bmN0aW9uIHRlc3QKaXMgZmFpbGluZy4gVGhlIGNoaWxkIGlzIGdldHRpbmcgYSBHQ1Mg
U2VnbWVudGF0aW9uIGZhdWx0IHdoZW4gcmV0dXJuaW5nCmZyb20gZm9yaygpLgoKSSB0cmllZCBk
ZWJ1Z2dpbmcgaXQgd2l0aCBHREIsIGJ1dCBJIGRvbid0IHNlZSB3aGF0J3Mgd3Jvbmcgc2luY2Ug
dGhlCmFkZHJlc3MgaW4gTFIgbWF0Y2hlcyB0aGUgZmlyc3QgZW50cnkgaW4gR0NTUFIuIEhlcmUg
aXMgdGhlCmRlYnVnIHNlc3Npb246CgooZ2RiKSBicmVhayBsaWJjLWdjcy5jOjU4CkJyZWFrcG9p
bnQgMSBhdCAweDM4OTQ6IGZpbGUgbGliYy1nY3MuYywgbGluZSA1OC4KKGdkYikgc2V0IGZvbGxv
dy1mb3JrLW1vZGUgY2hpbGQKKGdkYikgcgpTdGFydGluZyBwcm9ncmFtOiAvdmFyL3RtcC9zZWxm
dGVzdHMvYXJtNjQvbGliYy1nY3MKW1RocmVhZCBkZWJ1Z2dpbmcgdXNpbmcgbGlidGhyZWFkX2Ri
IGVuYWJsZWRdClVzaW5nIGhvc3QgbGlidGhyZWFkX2RiIGxpYnJhcnkgIi9saWIvYWFyY2g2NC1s
aW51eC1nbnUvbGlidGhyZWFkX2RiLnNvLjEiLgpUQVAgdmVyc2lvbiAxMwoxLi4xMTgKIyBTdGFy
dGluZyAxMTggdGVzdHMgZnJvbSAzMiB0ZXN0IGNhc2VzLgojICBSVU4gICAgICAgICAgIGdsb2Jh
bC5jYW5fY2FsbF9mdW5jdGlvbiAuLi4KW0F0dGFjaGluZyBhZnRlciBUaHJlYWQgMHhmZmZmZjdm
ZjdlODAgKExXUCA5MTY0KSBmb3JrIHRvIGNoaWxkIHByb2Nlc3MgOTE2OF0KW05ldyBpbmZlcmlv
ciAyIChwcm9jZXNzIDkxNjgpXQpbRGV0YWNoaW5nIGFmdGVyIGZvcmsgZnJvbSBwYXJlbnQgcHJv
Y2VzcyA5MTY0XQpbSW5mZXJpb3IgMSAocHJvY2VzcyA5MTY0KSBkZXRhY2hlZF0KW1RocmVhZCBk
ZWJ1Z2dpbmcgdXNpbmcgbGlidGhyZWFkX2RiIGVuYWJsZWRdClVzaW5nIGhvc3QgbGlidGhyZWFk
X2RiIGxpYnJhcnkgIi9saWIvYWFyY2g2NC1saW51eC1nbnUvbGlidGhyZWFkX2RiLnNvLjEiLgoK
VGhyZWFkIDIuMSAibGliYy1nY3MiIHJlY2VpdmVkIHNpZ25hbCBTSUdTRUdWLCBTZWdtZW50YXRp
b24gZmF1bHQKR3VhcmRlZCBDb250cm9sIFN0YWNrIGVycm9yLgpbU3dpdGNoaW5nIHRvIFRocmVh
ZCAweGZmZmZmN2ZmN2U4MCAoTFdQIDkxNjgpXQoweDAwMDBmZmZmZjdlYzZmYzAgW0dDUyBlcnJv
cl0gaW4gX19HSV9fRm9yayAoKSBhdCAuLi9zeXNkZXBzL25wdGwvX0ZvcmsuYzo1MAp3YXJuaW5n
OiA1MCAgICAgLi4vc3lzZGVwcy9ucHRsL19Gb3JrLmM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkKKGdkYikgYnQKIzAgIDB4MDAwMGZmZmZmN2VjNmZjMCBbR0NTIGVycm9yXSBpbiBfX0dJX19G
b3JrICgpIGF0IC4uL3N5c2RlcHMvbnB0bC9fRm9yay5jOjUwCiMxICAweDAwMDBmZmZmZjdlYzZi
ZTAgaW4gX19saWJjX2ZvcmsgKCkgYXQgLi9wb3NpeC9mb3JrLmM6NzMKIzIgIDB4MDAwMGFhYWFh
YWFhNDliOCBpbiBfX3J1bl90ZXN0IChmPWZAZW50cnk9MHhhYWFhYWFhYjk4YzggPF9maXh0dXJl
X2dsb2JhbD4sCiAgICB2YXJpYW50PXZhcmlhbnRAZW50cnk9MHhmZmZmZmZmZmVmYjgsIHQ9dEBl
bnRyeT0weGFhYWFhYWFiODFiMCA8X2Nhbl9jYWxsX2Z1bmN0aW9uX29iamVjdD4pCiAgICBhdCAv
aG9tZS90aGlhZ28uYmF1ZXJtYW5uL3NyYy9saW51eC90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
c2VsZnRlc3RfaGFybmVzcy5oOjExMjgKIzMgIDB4MDAwMGFhYWFhYWFhMmFjNCBpbiB0ZXN0X2hh
cm5lc3NfcnVuIChhcmd2PTB4ZmZmZmZmZmZmMTU4LCBhcmdjPTEpCiAgICBhdCAvaG9tZS90aGlh
Z28uYmF1ZXJtYW5uL3NyYy9saW51eC90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rc2VsZnRlc3Rf
aGFybmVzcy5oOjExOTkKIzQgIG1haW4gKGFyZ2M9MSwgYXJndj0weGZmZmZmZmZmZjE1OCkgYXQg
bGliYy1nY3MuYzo3MzUKKGdkYikgcCAkZ2NzcHIKJDEgPSAodm9pZCAqKSAweGZmZmZmN2RmZmZl
MAooZ2RiKSBwL3ggJGxyCiQzID0gMHhmZmZmZjdlYzZiZTAKKGdkYikgcC94ICoodW5zaWduZWQg
bG9uZyAqKSRnY3NwcgokNSA9IDB4ZmZmZmY3ZWM2YmUwCihnZGIpIGRpc2Fzc2VtYmxlCkR1bXAg
b2YgYXNzZW1ibGVyIGNvZGUgZm9yIGZ1bmN0aW9uIF9fR0lfX0Zvcms6CiAgIDB4MDAwMGZmZmZm
N2VjNmY3MCA8KzA+OiAgICAgbXJzICAgICB4NSwgdHBpZHJfZWwwCiAgIDB4MDAwMGZmZmZmN2Vj
NmY3NCA8KzQ+OiAgICAgbW92ICAgICB4MCwgIzB4MTEgICAgICAgICAgICAgICAgICAgICAgIC8v
ICMxNwogICAweDAwMDBmZmZmZjdlYzZmNzggPCs4PjogICAgIHN1YiAgICAgeDYsIHg1LCAjMHg3
YzAKICAgMHgwMDAwZmZmZmY3ZWM2ZjdjIDwrMTI+OiAgICBzdWIgICAgIHg0LCB4NSwgIzB4NmYw
CiAgIDB4MDAwMGZmZmZmN2VjNmY4MCA8KzE2PjogICAgbW92ayAgICB4MCwgIzB4MTIwLCBsc2wg
IzE2CiAgIDB4MDAwMGZmZmZmN2VjNmY4NCA8KzIwPjogICAgbW92ICAgICB4MSwgIzB4MCAgICAg
ICAgICAgICAgICAgICAgICAgIC8vICMwCiAgIDB4MDAwMGZmZmZmN2VjNmY4OCA8KzI0PjogICAg
bW92ICAgICB4MiwgIzB4MCAgICAgICAgICAgICAgICAgICAgICAgIC8vICMwCiAgIDB4MDAwMGZm
ZmZmN2VjNmY4YyA8KzI4PjogICAgbW92ICAgICB4MywgIzB4MCAgICAgICAgICAgICAgICAgICAg
ICAgIC8vICMwCiAgIDB4MDAwMGZmZmZmN2VjNmY5MCA8KzMyPjogICAgbW92ICAgICB4OCwgIzB4
ZGMgICAgICAgICAgICAgICAgICAgICAgIC8vICMyMjAKICAgMHgwMDAwZmZmZmY3ZWM2Zjk0IDwr
MzY+OiAgICBzdmMgICAgICMweDAKICAgMHgwMDAwZmZmZmY3ZWM2Zjk4IDwrNDA+OiAgICBjbW4g
ICAgIHgwLCAjMHgxLCBsc2wgIzEyCiAgIDB4MDAwMGZmZmZmN2VjNmY5YyA8KzQ0PjogICAgYi5o
aSAgICAweGZmZmZmN2VjNmZjNCA8X19HSV9fRm9yays4ND4gIC8vIGIucG1vcmUKICAgMHgwMDAw
ZmZmZmY3ZWM2ZmEwIDwrNDg+OiAgICBtb3YgICAgIHcyLCB3MAogICAweDAwMDBmZmZmZjdlYzZm
YTQgPCs1Mj46ICAgIGNibnogICAgdzAsIDB4ZmZmZmY3ZWM2ZmJjIDxfX0dJX19Gb3JrKzc2Pgog
ICAweDAwMDBmZmZmZjdlYzZmYTggPCs1Nj46ICAgIHN1YiAgICAgeDAsIHg1LCAjMHg2ZTAKICAg
MHgwMDAwZmZmZmY3ZWM2ZmFjIDwrNjA+OiAgICBtb3YgICAgIHgxLCAjMHgxOCAgICAgICAgICAg
ICAgICAgICAgICAgLy8gIzI0CiAgIDB4MDAwMGZmZmZmN2VjNmZiMCA8KzY0PjogICAgbW92ICAg
ICB4OCwgIzB4NjMgICAgICAgICAgICAgICAgICAgICAgIC8vICM5OQogICAweDAwMDBmZmZmZjdl
YzZmYjQgPCs2OD46ICAgIHN0cCAgICAgeDAsIHgwLCBbeDYsICMyMTZdCiAgIDB4MDAwMGZmZmZm
N2VjNmZiOCA8KzcyPjogICAgc3ZjICAgICAjMHgwCiAgIDB4MDAwMGZmZmZmN2VjNmZiYyA8Kzc2
PjogICAgbW92ICAgICB3MCwgdzIKPT4gMHgwMDAwZmZmZmY3ZWM2ZmMwIDwrODA+OiAgICByZXQK
ICAgMHgwMDAwZmZmZmY3ZWM2ZmM0IDwrODQ+OiAgICBhZHJwICAgIHgxLCAweGZmZmZmN2ZhYTAw
MCA8c3lzX3NpZ2xpc3QrNDI0PgogICAweDAwMDBmZmZmZjdlYzZmYzggPCs4OD46ICAgIGxkciAg
ICAgeDEsIFt4MSwgIzM1MjhdCiAgIDB4MDAwMGZmZmZmN2VjNmZjYyA8KzkyPjogICAgbmVnICAg
ICB3MCwgdzAKICAgMHgwMDAwZmZmZmY3ZWM2ZmQwIDwrOTY+OiAgICBtb3YgICAgIHcyLCAjMHhm
ZmZmZmZmZiAgICAgICAgICAgICAgICAgLy8gIy0xCiAgIDB4MDAwMGZmZmZmN2VjNmZkNCA8KzEw
MD46ICAgc3RyICAgICB3MCwgW3g1LCB4MV0KICAgMHgwMDAwZmZmZmY3ZWM2ZmQ4IDwrMTA0Pjog
ICBtb3YgICAgIHcwLCB3MgogICAweDAwMDBmZmZmZjdlYzZmZGMgPCsxMDg+OiAgIHJldApFbmQg
b2YgYXNzZW1ibGVyIGR1bXAuCihnZGIpIHAgJHcwCiQ4ID0gMAooZ2RiKSBwICRfc2lnaW5mby5z
aV9zaWdubwokMTIgPSAxMQooZ2RiKSBwICRfc2lnaW5mby5zaV9jb2RlCiQxMyA9IDEwCihnZGIp
IHAgJF9zaWdpbmZvLl9zaWZpZWxkcy5fc2lnZmF1bHQuc2lfYWRkcgokMTQgPSAodm9pZCAqKSAw
eGZmZmZmN2VjNmZjMCA8X19HSV9fRm9yays4MD4KCi0tIApUaGlhZ28KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
