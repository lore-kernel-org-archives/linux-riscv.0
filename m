Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBA7C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 18:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=c11vSD5P7sYZXo1n2yO2bsP2cmfeOQvt3FGShxQOBeA=; b=ptJ5G/jTEqED/4
	g7/aDDZ0M993/tB62aCzNiGoUA7B/BfJiB3psZ5ta2H1m5zsNnb6iUzWMtKaI+Jw2BZscA5dzij0/
	RzEhkapzjRgottlialQCd93GbpUUm4AKYDXwSl0nPmiNa/aWx7Ho7IZ2UTpU9O3qVIdT5PmqQYVJC
	q5zQLSVKBBeKSwyOKdH0xn8GYyuauiFpIQf0TUAGmGD/0unjFeO0pn48O5GK4eQd/rKi6HZkRYAYk
	32yNUZdVKJp9IzlVn7D+2eIiD9T2Qkz0Ov/IJx5iet/2uoLnLjfFWIScHKxCIW/SFYRajba0KxSFE
	a68oGjzcJwEfJpxFj3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdZUR-000000018Xe-1tMj;
	Mon, 12 Aug 2024 18:09:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdZTo-000000018Qw-1dWx;
	Mon, 12 Aug 2024 18:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 055B0611FA;
	Mon, 12 Aug 2024 18:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A2BC32782;
	Mon, 12 Aug 2024 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723486154;
	bh=QPpTyfopkmYil5jwSWXiMRdlVekdVghmXXPWM89UkF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZooV+fEsbgVhEFJoJTLjXisilpk/izLOGKQdSjbK6BsiT3Mb3o4FqzNVOdzJ40HNN
	 G7D9unrBKPh2vyCeE+R7ZrkvVbuAHrJGI0AJW4x7nruBcaMLB7xyzgDIY/4mOdQcVg
	 OmWfzCXHyb54ARdVK19hknVOBXnJst/6h6XsjmjYQR3WK4HGdnI5i0UVbvZeGOxfOE
	 mwjevX4IZAJiVv6AzW3NYqXJiL12WqWuQnPX+GhD4lyjwWJOZ3fH9gqTdC21LIUjCQ
	 YIhbpf9mjzpAqkvlPduYxsdOs6w2NMz7kK4qIsW5LZA160D5y/rWFqfya3aTWa58H4
	 TnydXrSnnR/YA==
Date: Mon, 12 Aug 2024 13:09:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v8 01/17] arm64: PCI: Migrate ACPI related functions to
 pci-acpi.c
Message-ID: <20240812180912.GA286962@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812005929.113499-2-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_110916_491805_6D082FED 
X-CRM114-Status: UNSURE (   7.32  )
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

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDY6Mjk6MTNBTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IFRoZSBmdW5jdGlvbnMgZGVmaW5lZCBpbiBhcm02NCBmb3IgQUNQSSBzdXBwb3J0IGFyZSBy
ZXF1aXJlZAo+IGZvciBSSVNDLVYgYWxzby4gVG8gYXZvaWQgZHVwbGljYXRpb24sIG1vdmUgdGhl
c2UgZnVuY3Rpb25zCj4gdG8gY29tbW9uIGxvY2F0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN1
bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+IEFja2VkLWJ5OiBCam9ybiBIZWxn
YWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+IEFja2VkLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBr
ZXJuZWwub3JnPgo+IFRlc3RlZC1ieTogQmrDg8K2cm4gVMODwrZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KCkxvb2tzIGxpa2UgIkJqw7ZybiBUw7ZwZWwiIGdvdCBjb3JydXB0ZWQgc29tZXdoZXJl
IGFsb25nIHRoZSBsaW5lLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
