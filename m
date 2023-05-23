Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEF0C7EE26
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgF9tMeqgUVy0lRjDuOUSR0rBMBurbJdBDbkYnQLJfg=; b=Vs7ZCLWLD04LgSw6SsLl0tOz5l
	Vaja6XL9zstSysUlcyFxwpPd7sgqx+PiaOxh0BtfNPCWwjuZq7iZItXpSTF0nq+HukZyPJUWdiq8A
	foVNXhTyjsTAqv2OiQ0p+h94E/F8Jy3r/rJBpVBYO7fTmCapzmkQX0PHnKQwKuGn/DJ0n1z8TMsw0
	/LDGzYXu+312GRiKkwydZoy041Dbnk1DOmUiY8urWHTnGyoXsrqJtVHgakQHEhwhnHzQYns/2XI3L
	eoEGrG8abcZaO40Jh5HjDBvizkiDFiWlKxZ/ZMvcRJsDdgl3Xm/+O9jvcbgKaaz/V1Ub7XGen4PPO
	oGXdv8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1P7b-009pni-0j;
	Tue, 23 May 2023 10:20:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1P7G-009pTR-2p;
	Tue, 23 May 2023 10:19:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E39526299B;
	Tue, 23 May 2023 10:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C28C433EF;
	Tue, 23 May 2023 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684837181;
	bh=Hw4JvCY5c+o4xH0G4/ilqKI5AiMs+w7Ev9t6iQW4VSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oF2yAr9oIBfEhw1WDj0+q079mjfRIQXD6lWaXj8yNXAn1n4z5I3T3WlcM2TNAp7BF
	 3+mepvSeWgLSFPGRpuTo+CmYRAec4PvQfzIorMGn6yyibuLZ+uMHnKEPKbGU/cqsEL
	 HIGrssrbPot9AwfgDePO4CWvJXLEo2uEycOdlIOPtFLlMGIpRPahL70lwHpFEa+/X0
	 VMbLgxkGmQ2R6F7FOqgy2ab4kG5KRr2d+OOQm9hFDt2oSgWdT83u8H5GBi+RujDc0e
	 O4ePjS+L2NzuJecudp/Eshc86kg5/RUvBP1TJO5lUtLG1gH6E0FDVmMY2aqUv7Oz66
	 lyfVOGhf/Vr2A==
Date: Tue, 23 May 2023 11:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch V4 33/37] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
Message-ID: <7377ca00-cb66-430f-9c97-55c60bf5d40e@sirena.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.240231377@linutronix.de>
 <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk>
 <87bkicw01a.ffs@tglx>
 <2ed3ff77-c973-4e23-9e2f-f10776e432b7@sirena.org.uk>
 <87wn10ufj9.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <87wn10ufj9.ffs@tglx>
X-Cookie: Beware of low-flying butterflies.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_031943_071630_29EE187C 
X-CRM114-Status: GOOD (  13.91  )
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
Content-Type: multipart/mixed; boundary="===============0056554319253491809=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0056554319253491809==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Folw/pFEu4pCxXPv"
Content-Disposition: inline


--Folw/pFEu4pCxXPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 01:12:26AM +0200, Thomas Gleixner wrote:

> Let me find a brown paperbag and go to sleep before I even try to
> compile the obvious fix.

That fixes the problem on TX2 - thanks!

Tested-by: Mark Brown <broonie@kernel.org>

--Folw/pFEu4pCxXPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRskzEACgkQJNaLcl1U
h9BsgAf9GF4VsHf+jkaRuKOvlac1rE2bFEpVYeMuNf6KbqeD4odFEYIAUQA+YDLK
cQfMclu7qJPPej3ztYBbyVR+3mXH9m+tx5c784FHFJnEyG4Fz5bbVGEBLlcT+PCQ
AIM3pioDp3hHXcHZFKw8MyT/3VII4gf4yGIsw/rtWZZgPOvk0a1G3nctOClgwrqm
asYtDEGLWUnXYKNWNv5dqfCq7olIGl+y4R3mn9KobyW13YvPEmn9uhHz7WuOGHrI
XeXeNgg92QVhmIrSrSbLU+lUrxTqdNNE1CBav+R6fS0nmwNoKdMqgdlZok0toOUw
PoCHQ6x7O7dUMlMoIsrUsIcDOSqrdw==
=lXgK
-----END PGP SIGNATURE-----

--Folw/pFEu4pCxXPv--


--===============0056554319253491809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0056554319253491809==--

