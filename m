Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276DACCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YjxLSZGuGJUhpQ4zst/lIFPSXD957Hqi4uBZwZrN6uU=; b=IHl
	R5x24hdRC5KroADoWwlXJlJZN+WqLa219UxN16h0iyeM6LfPmcxFe/TsJj+sRAwHp8fflRFPy0d6S
	ydJX4UYPMxbz8QZ4Kj0ewnAUpqJ/u87MUlNhECRUndkYeYbtI9K1kzoIXjKRQLH3HHCsiWrWfvpuE
	nXrZL+fHbBA4f4Uk3NAYSCyboy3ABctMxELm91y3tAD3ZQ9XSDUzonSLEVn8Q6a/s49+7uY2RD3zu
	z/8EJTfovog0CfmprqpZWu9ghKpbe33Kb94wtZMej5RuZbE6JK7LQ/UINqgCfO2PldFDxTmIekcwT
	mKo6s0k5tZKctl34voKIWoxSz0C9dEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipo-00000004d0I-2WGV;
	Thu, 23 Oct 2025 00:05:40 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipn-00000004czZ-09tf
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 00:05:40 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so480459a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 17:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177938; x=1761782738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=;
        b=2po47XVoFIW+1ioT5ibyUSjYyIX+x/+RpsE6gnzJBjxAihpM4N2bNwLwtQnbt6D+B2
         BN5E6heYimteIkzaXrViUr5bYfrFIuBhb1g+Y09OlqPVna5n6ok6p+3/e9iZnq5lWqAo
         g7ISDeAeHF6+u6T64sTqdlMvA9Vpwqwz8rl0AgiAU0EVmnEUdkVxa47Pn9c8Ke+gUU8P
         sEXYyUcDatoxitEEqAkV8exgPCMnPfk6svIHG0Ckf0v/lCk9sgM/ahe/C0ERy8Slalnv
         ojGwwNpjqNlOw8kWaRbBXpj1Nsii6XeQXCSi6lDiZO7nMb+qJhE1tAR6ABz0pAGiH9Tx
         gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177938; x=1761782738;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=;
        b=bLmw6cqnwMmzEdBfQSQuDpFQTKyTtzobY5wpU3XjOFkwKZlYkQ4VCpRVHpaQslwXtA
         kyK8dN3cb4LTE5WpvemI7Yj7w0+TKwouyJAdHT60LHc2obEC0uMcseVT8hYKo1CqQz+S
         GToIbvb8anB2q00f65345ycZALC/H2GS1RCK526yeYxfEglNtj+JYuBkCSoXDgfnYP+a
         XOlgH1/MY8ZmYQQhtSZpJfa2YYVkiZZZSjf3pmtq9loeSWbkkYsF4kL3Kr+wbfIxedyy
         hYblkgNg0Bhsc1TkaaM4unrcCbRRH4UZS+yt5s9uSINxQSEb0QnuGV4QdnQOZVpl3bvA
         KjQw==
X-Forwarded-Encrypted: i=1; AJvYcCWSW98oy5z7MzwJgSvoyRax4Ao3r59PzVlFXShYUr1Mwi9vqk91Lb0xdMiKtQrFNeY/V7MbZ5YhO+sfbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw26gasV1s0/qQ1sL+6AX9ntxG3JA5YEPtIvpud95J3I/K0GgHf
	U9MXowQWfRXk52LF7HB4yoUCA0JkjSB2ZinpL6ftfiYKj7NSJcd4ypjbfqVtooOJRw/5MvyRv+o
	gqSLMcQ==
X-Google-Smtp-Source: AGHT+IF6lSdbdtyS+/t/fGvEsbBKEiGOc0L8/NdAr9Cp2dQPW0iljcBuf5Kq/IEP9uj1boUHsE/v/xDHW1g=
X-Received: from pjih1.prod.google.com ([2002:a17:90a:5801:b0:33e:28eb:7df2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cb:b0:339:9f7d:92d4
 with SMTP id 98e67ed59e1d1-33bcf87b8a5mr30997233a91.9.1761177937783; Wed, 22
 Oct 2025 17:05:37 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-1-kuniyu@google.com>
Subject: [PATCH v1 0/2] epoll: Save one stac/clac pair in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_170539_092966_4AC622F1 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

ZXBvbGxfcHV0X3VldmVudCgpIGNhbGxzIF9fcHV0X3VzZXIoKSB0d2ljZSwgd2hpY2ggYXJlIGlu
bGluZWQKdG8gdHdvIGNhbGxzIG9mIG91dC1vZi1saW5lIGZ1bmN0aW9ucywgX19wdXRfdXNlcl9u
b2NoZWNrXzQoKQphbmQgX19wdXRfdXNlcl9ub2NoZWNrXzgoKS4KCkJvdGggZnVuY3Rpb25zIHdy
YXAgbW92IHdpdGggYSBzdGFjL2NsYWMgcGFpciwgd2hpY2ggaXMgZXhwZW5zaXZlCm9uIGFuIEFN
RCBFUFlDIDdCMTIgNjQtQ29yZSBQcm9jZXNzb3IgcGxhdGZvcm0uCgogIF9fcHV0X3VzZXJfbm9j
aGVja180ICAvcHJvYy9rY29yZSBbUGVyY2VudDogbG9jYWwgcGVyaW9kXQogIFBlcmNlbnQg4pSC
CiAgICA4OS45MSDilIIgICAgICBzdGFjCiAgICAgMC4xOSDilIIgICAgICBtb3YgICVlYXgsKCVy
Y3gpCiAgICAgMC4xNSDilIIgICAgICB4b3IgICVlY3gsJWVjeAogICAgIDkuNjkg4pSCICAgICAg
Y2xhYwogICAgIDAuMDYg4pSCICAgIOKGkCByZXRxCgpUaGlzIHdhcyByZW1hcmthYmxlIHdoaWxl
IHRlc3RpbmcgbmVwZXIvdGNwX3JyIHdpdGggMTAwMCBmbG93cyBwZXIKdGhyZWFkLgoKICBPdmVy
aGVhZCAgU2hhcmVkIE8gIFN5bWJvbAogICAgMTAuMDglICBba2VybmVsXSAgW2tdIF9jb3B5X3Rv
X2l0ZXIKICAgICA3LjEyJSAgW2tlcm5lbF0gIFtrXSBpcDZfb3V0cHV0CiAgICAgNi40MCUgIFtr
ZXJuZWxdICBba10gc29ja19wb2xsCiAgICAgNS43MSUgIFtrZXJuZWxdICBba10gbW92ZV9hZGRy
X3RvX3VzZXIKICAgICA0LjM5JSAgW2tlcm5lbF0gIFtrXSBfX3B1dF91c2VyX25vY2hlY2tfNAog
ICAgIC4uLgogICAgIDEuMDYlICBba2VybmVsXSAgW2tdIGVwX3RyeV9zZW5kX2V2ZW50cwogICAg
IC4uLiAgICAgICAgICAgICAgICAgIF4tIGVwb2xsX3B1dF91ZXZlbnQoKSB3YXMgaW5saW5lZAog
ICAgIDAuNzglICBba2VybmVsXSAgW2tdIF9fcHV0X3VzZXJfbm9jaGVja184CgpQYXRjaCAxIGFk
ZHMgYSBuZXcgdWFjY2VzcyBoZWxwZXIgdGhhdCBpcyBpbmxpbmVkIHRvIGEgYmFyZSBzdGFjCndp
dGhvdXQgYWRkcmVzcyBtYXNraW5nIG9yIHVhY2Nlc3Nfb2soKSwgd2hpY2ggaXMgYWxyZWFkeSBj
aGVja2VkCmluIGVwX2NoZWNrX3BhcmFtcygpLgoKUGF0Y2ggMiB1c2VzIHRoZSBoZWxwZXIgYW5k
IHVuc2FmZV9wdXRfdXNlcigpIGluIGVwb2xsX3B1dF91ZXZlbnQoKS4KCgpLdW5peXVraSBJd2Fz
aGltYSAoMik6CiAgdWFjY2VzczogQWRkIF9fdXNlcl93cml0ZV9hY2Nlc3NfYmVnaW4oKS4KICBl
cG9sbDogVXNlIF9fdXNlcl93cml0ZV9hY2Nlc3NfYmVnaW4oKSBhbmQgdW5zYWZlX3B1dF91c2Vy
KCkgaW4KICAgIGVwb2xsX3B1dF91ZXZlbnQoKS4KCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Vh
Y2Nlc3MuaCAgIHwgIDEgKwogYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDEz
ICsrKysrKysrKystLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgfCAgMSAr
CiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgIHwgIDEgKwogaW5jbHVkZS9saW51
eC9ldmVudHBvbGwuaCAgICAgICAgICB8IDEzICsrKysrKysrLS0tLS0KIGluY2x1ZGUvbGludXgv
dWFjY2Vzcy5oICAgICAgICAgICAgfCAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgotLSAKMi41MS4xLjgxNC5nYjhmYTI0NDU4Zi1nb29nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
