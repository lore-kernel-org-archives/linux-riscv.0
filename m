Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD2CCF9FA
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCGs6wHqtGVJaNLzL2PpasH34j6JA+7XmmqZsQf7dZQ=; b=CrD1C0+bSJJQFe
	jUpxHE5GDWxLV6TnMfzwjP7WgZp6hhlkUkdTIke9ZJl/WrIvyZpHnygSU/sO9AEHR5xPw0CtPOYl4
	/X/E/ddw+l2GELJ6EORshcI8h594oNkhNYwG9dN0fqIdplvPywhjYAM6/zGr007l3NcU6Lqpxyafh
	jo8+GV1/PXABFB9C4HV20IjUqBYIh/ph2wNlUJiMK4CUrNs8hw9yktWUgZKqjY06zC6npkxEDxJu8
	t8PqePDaPyjzyv12bufWgZfNX5bb1Sss1QetxB2UM+jqKJ+CbL7AJbv8f6NVdjr3f/Q6C/2x/2L2e
	GDBC4TEGJtzFOCIljtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElrJ-00000005q90-3Vme;
	Fri, 31 Oct 2025 09:55:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElrG-00000005q7y-1RTb
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 09:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761904543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3tkSelHNNZtYzi5EY8XsAlaXp+ewc844ITqqtJnf0nc=;
	b=jGXz+N0Xk/7S64L1ReK1guLY7KAZkb6rSWnryilFD/V/oKvdS171wmlS/rOpCA3KANQqnV
	M7FGlPNPHBAheKOsp5GuYE1CkD/pruuXsimm1UAjwanoBX5AFNcMI/NW4/GDQLVndOXSCD
	5gGOrZ6ZNk2iKe2tOGpmUY0TC8wo10E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-2RjIhWJyNi-MR5YaRChqow-1; Fri, 31 Oct 2025 05:55:40 -0400
X-MC-Unique: 2RjIhWJyNi-MR5YaRChqow-1
X-Mimecast-MFC-AGG-ID: 2RjIhWJyNi-MR5YaRChqow_1761904539
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-427015f63faso1209246f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 02:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904539; x=1762509339;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTCg+N3NYwBLqF+pIITZOoHrF01dYEOCOu0+H1nRDT0=;
        b=uNFDRTHn+5vAdTgXZ6fdUOLam2QMzaXCetRBhlBZ3iI/Yu6PqiVhCtvBPpKJoNqLuH
         xjWVKVAWFyb7guxf27dXmm2YxWZGfA3w3Z5bhulQktNHC7S0k+JkcGWvY66V98VK+bkL
         0d528yirDyUTE0D5XYDaQXX8YTsEG/os3qflP7nwc2WftP0bLs9ujIdUxFhhbkl21CiV
         BPy5XBsmHJhb8sfmZOZ1jfUMbjuRmNzsutMqANgjrLGcTvA52RNg+d3GZQDTucFaz6eu
         624hMH6dB2uWOn4Y5N61cKQA3CQmPpkK4OWLVP192qCadhsN3FJjgFxtlXfyB9hmhLjO
         wjew==
X-Forwarded-Encrypted: i=1; AJvYcCXuCpOWWUp7FXKkKMVoXVbIfZ3MCOra5nxUaGj7foKxxgkq3A+V+jdgcRmbx3ZdEbgmctLvXSn7j8f2LA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKqfIYrwNFK6/nDcdFuJy1WQoxJ1Jd57vV3FeRj2MZW2KJ7BSm
	FJUdEp8r8HFaRke6uf5tUmPGRetQdhdM0q8WW+2TA1mauYGRTapHNci5DBBfgEUrY8pJBdvUvoH
	AKcOSaPHo58Z8EsvBBFyFoyDT8PKtfYSfw92OeWzMX/urvow/Y01KhVMabnQguSFtQbkXCA==
X-Gm-Gg: ASbGncvRGZd2wZIq6r0M6AJMAtTESTUEfAotMq3AwtYAawD7ImYlMqV7UwAYVUZx7DD
	aMQjQcTPcYdLD9wp5Oklm7cSgEJnWS6jba/5l8n8AKFet2JbMVaDobsDwhO6dKyjFc3X5P9aq+3
	ZBF2IxblbUOOlSxkdHJGblc74Sd3pRlVsOyrQcSPyb1dw44oHHDPZjNFuRBVtHngVGAjdCBBgKy
	Sc1T7qKvO2SYGNEQY5MRfwkICU/svfr9+X8d5cwMpXs13h0KnJ7m8Flgp/srrPzP+Gl1gbzpK4P
	TiyuoYR7NXvt0QHkB5L7WX88z3Eyp6boUoiTXH7Z5iT/G2LSHohXqPuMwX0oqj7u/YGaheyc/gA
	q18iPKoKi7Fhdit2Yfjbhoyw0i4dgoitvFVi1eVsbphntIZUjLbgyxtVTFQf8
X-Received: by 2002:a05:6000:310f:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429bd68869amr2437822f8f.12.1761904539508;
        Fri, 31 Oct 2025 02:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbUxApmJAOYlrcJigfNqaTRZ7Pz52J94NiUAhMgZ/Qwj+7BmCVMNCnPqwOLJ11D9kpjdgFWQ==
X-Received: by 2002:a05:6000:310f:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429bd68869amr2437793f8f.12.1761904539055;
        Fri, 31 Oct 2025 02:55:39 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1406a45sm2624895f8f.47.2025.10.31.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:55:38 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, "David S. Miller" <davem@davemloft.net>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, Boqun Feng
 <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [RFC PATCH v6 27/29] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
In-Reply-To: <aQIpXyX-z8ltB1i5@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
 <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQHtBudA4aw4a3gT@localhost.localdomain>
 <xhsmhwm4dpzh4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQIpXyX-z8ltB1i5@localhost.localdomain>
Date: Fri, 31 Oct 2025 10:55:36 +0100
Message-ID: <xhsmhtszfpf8n.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y0ZxUjodZhIvqullfK3OD7kqevpiT00i_0Q8KQaBKWo_1761904539
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_025546_445023_CF9FFD68 
X-CRM114-Status: GOOD (  12.74  )
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

T24gMjkvMTAvMjUgMTU6NDksIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgV2VkLCBP
Y3QgMjksIDIwMjUgYXQgMDM6MTM6NTlQTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4gR2l2ZW4gd2UgaGF2ZSBBTFRFUk5BVElWRSdzIGluIHRoZXJlIEkgYXNzdW1lIHNv
bWV0aGluZyBsaWtlIGEKPj4gYm9vdC10aW1lLWRyaXZlbiBzdGF0aWMga2V5IGNvdWxkIGRvLCBi
dXQgSSBoYXZlbid0IGZvdW5kIG91dCB5ZXQgaWYgYW5kCj4+IGhvdyB0aGF0IGNhbiBiZSBzaG92
ZWQgaW4gYW4gQVNNIGZpbGUuCj4KPiBSaWdodCwgSSB0aG91Z2h0IEkgaGFkIHNlZW4gc3RhdGlj
IGtleXMgaW4gQVNNIGFscmVhZHkgYnV0IEkgY2FuJ3QgZmluZCBpdAo+IGFueW1vcmUuIGFyY2gv
eDg2L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaCBpcyBmdWxsIG9mIHJldXNhYmxlIG1hZ2ljCj4g
dGhvdWdoLgo+CgpJIGdvdCBzb21ldGhpbmcgdWdseSB0aGF0IC9zZWVtcy8gdG8gd29yaywgbm93
IHRvIHNwZW5kIHR3aWNlIHRoZSB0aW1lIHRvCmNsZWFuIGl0IHVwIDotKQoKPiBUaGFua3MuCj4K
PiAtLQo+IEZyZWRlcmljIFdlaXNiZWNrZXIKPiBTVVNFIExhYnMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
