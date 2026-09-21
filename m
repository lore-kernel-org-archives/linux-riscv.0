Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99E5C982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AghadFYCCbvU+ffFXjUdgEmlmw5zhxpE62ILmqsmjvk=; b=s6EnfEmG2zqg5/
	G1ibkkwju1ptTx/Zq1ZQV8f7GpZaOdxpdD++mibkGS7VFlWyvEWhK/zdlhPPVPOCekjyVSPRIH9Zp
	ytQy7usSLA7xrclqKsMOtzEh/MAy2nYNSzVHg+nSbERtptAQT+NXAiF9fsP6lA+Xd9l0bZeQUY3mH
	iqkM0oXauDzoN32wqXCEV0WvP8g7tmE8dnLKShTPf8n9bqMMJgYlsyqMKghVpvvNwKWJv18umCyBV
	SxA+Z5mnrcAm4nTJFuE08/L3GQp7w7AWOWvLCyZFKONxT6ySROmBhh3Y57GxG1fNjzTrj2+ZkDQmu
	Mugdo+tmtEWFBF/+QUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byt-00000001qJp-3Djq;
	Mon, 21 Sep 2026 11:14:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bym-00000001qEi-3hoK;
	Mon, 21 Sep 2026 11:14:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DEAB60142;
	Mon, 21 Sep 2026 11:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6DD1F00893;
	Mon, 21 Sep 2026 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989275;
	bh=FVPnbDPg6NPVwGQT/C+W1Qu/uMpuyNippfZ5fBWEgG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fXmd1bjU8aLo6SvjWyXlK7EgKy3qhO9x42gtcVQGXnYHEQrCLkXE8KnqfNfeN4pG3
	 3HP2dQ6OkDabXncrsuTR0D8KQH5PJd12zw6G4bKcv+hg64C3AclNq190EgNjAUkbG1
	 1KSo1r9tsi++b/VDebVqOhOM8NaKRtk2MAJqOSbXDby25wNecnx0JX3QkgRJVPXj8J
	 DW+A63pV82bCeSQGN0SrW0C7Fbb2L9RS/eUEtDZT9x20EhMeyY2vMLuxMm1o+nyM1v
	 gjI6nfFi+wKOLyHAqhsXvjQPW1cNaoqf/moX9ZWUtAY56OwDsJpgtAGiFQvGrK3HO0
	 bqDkmc74T4gTQ==
Date: Mon, 21 Sep 2026 12:14:29 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] arch_topology: Parse die nodes in /cpu-map
Message-ID: <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
 <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev>
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

On Sun, Sep 20, 2026 at 11:18:03AM +0800, Troy Mitchell wrote:
> The devicetree CPU map can distinguish packages and clusters but cannot
> describe multiple dies in one package. Such systems have to flatten all
> clusters into the package, making cluster identifiers package-wide and
> hiding the die boundary.
> 
> Recognize an optional sequence of dieN nodes between a socket and its
> clusters, and propagate the die identifier to every CPU below it. Enumerate
> clusters independently below each die.
> 
> When a CPU map has no dieN nodes, continue parsing its existing package
> and cluster hierarchy but pass -1 as the die identifier. Legacy maps
> therefore remain compatible without being reported as an explicitly
> described die 0.
> 

Where is the associated bindings ? Am I missing to check it in the series
or it is really missing ? It is essential to add any code using the binding.

Also how does it align with ACPI implementation ? It is preferred to be
in parity here, so we need some binding there as well IMHO.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
