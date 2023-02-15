Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3455C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 08:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QO8oqHhy73zSx/Z5xdR2n3It+clT9XDlOAX1G7WJuPE=; b=BJJFUfFHTtQ3w7
	5gldSi5Lc4r3s2bOaxg+lLNMhCQddsvDijtPm3Y5p2Wei71DCDqj7BkYPfOCu4S/WoLLJowtuo9cF
	IpjDtxnm2y6vTxKk2nXzN2T9BXSnpHREQYS7GNHPAf0BcPKGDHz3nRo2cPT4v49CczT4dsXZiBD0x
	4XwOpS8wZXBmhkQy62htrljpG/Uzda4Y7AbvuDx4ODaePDX0hfgA+hohuzOl8I+qZxcVOxLfFH1Ad
	RFwM5LDTyUIg/D9ydpkrOuTcL+Bm8L9d3r07t5M0E5qBUAfTJYYY42ziX/+4V8CQAtjTTC6piL03F
	9LL8BTsFOl12bjfRIUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCm0-0058ET-O3; Wed, 15 Feb 2023 08:04:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSClz-0058D5-2a
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 08:04:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id o15so14827395wrc.9
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 00:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0PNomvRj7hf1yb3zjFxN+WA4g/LrO9vhkLpkP8esTM=;
        b=K5P7VFpsmNGVSMEHcKncWSY2Fyox5+JfcV4KxPmF6FeGwQTOaN2s8Kr4zheVvZiokx
         n0fiqernPCWkuLa/OdKZZevuOyiETys43P2kbQ5DA/gk3W5lMJ6uUI5RPb5iM+1mjogC
         wFC6zERt6FxTUxWqMIQFg1g5Xst4wnqiqjJvU0CguXp1miyjtHpf9ev8cgitbRjptVca
         EQEfxT5Tp805hQVvfb7VUSgU1WgfEocYqIIsbvEOl/udLz3j9iYsrIolw4NW191hoGlu
         fgN4Hien2b00pSBQZLr8lOsQCTL8moYxf2ZIqwsjmBt5mkRojQWru/QZ/dtQBuKzJuR4
         GmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0PNomvRj7hf1yb3zjFxN+WA4g/LrO9vhkLpkP8esTM=;
        b=oj7WnDEUmSpMTh7KGsPajl4Qq473IuaU4ZBn3WPvHFZZoRc1S9od0NYqvTyzy7ufo9
         ZitPTKyvCmd6J0MBq3d/1UuuQGDE8Ch5gTeypHi9Cg+Ng86IySqDkH9XmvlhKyvdTq4I
         DJYbYWOkh+jaXVyYde6pa8h8LXVBoOc2dbQLOhBvCoN9Qz/rc1QxWbBuJGQMU+AfPdJd
         0EeyHwXp6rUp+rM4OqG/cc+FNKbnQA8kwmONJgu2Z1u5PYdMGmTcZE/6iEtBiryuMSo3
         frBcVoRaG2naWo9aWGcUqO51EAk3ihVa7BGdLJdBiaOTWVnmT4e3ScUp/jqawg0col72
         xEKQ==
X-Gm-Message-State: AO0yUKVECl6KgqeV9fP+RkqoAd1CH/fSP4GFHSXfGZ20XzlW9UBEAV/w
	J60MAdPSf9qTBeWeyHCVz6pj+Q==
X-Google-Smtp-Source: AK7set8SY/K8xTB04Sftv5CRmwP0Eb7wShb0AJguVdTk29FcDZHSC8AB5hhDs77ckn8H3ZLmnvnT2w==
X-Received: by 2002:a05:6000:120e:b0:2c5:63df:1171 with SMTP id e14-20020a056000120e00b002c563df1171mr773187wrx.19.1676448252171;
        Wed, 15 Feb 2023 00:04:12 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c47d500b003db0bb81b6asm1284781wmo.1.2023.02.15.00.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 00:04:11 -0800 (PST)
Date: Wed, 15 Feb 2023 09:04:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	vineetg@rivosinc.com, heiko@sntech.de, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>,
	Atish Patra <atishp@rivosinc.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Tobias Klauser <tklauser@distanz.ch>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
Message-ID: <20230215080410.65zbhimqbs2kbmod@orel>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <Y+wedUsNEfWsKU5I@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+wedUsNEfWsKU5I@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_000415_123530_9C1091B1 
X-CRM114-Status: GOOD (  13.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 14, 2023 at 11:51:17PM +0000, Conor Dooley wrote:
> Hey Evan,
> 
> Just as a preface, I'm reviewing this lot from a position of ignorance
> on what glibc wants so I'll refrain from commenting on call itself.
> I figure that since the commentary has kinda died on the sysfs front &
> Palmer seems to be still into the syscall stuff, that we're pushing on
> with this approach...

If I can find time (that's a big if, atm) I'd be willing to do a sysfs
prototype just for comparison/benchmarking purposes, even if the chances
it gets merged are low. But, time...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
