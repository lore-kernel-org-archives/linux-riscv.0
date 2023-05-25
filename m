Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1935C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN9obv+hSXhg2pfsYSCVAJczVt2xXzTR0gFPsP2Viso=; b=VTojMRjIbQUd4vXAWre4ZYvmHJ
	Fy9EZlb/CHwv/W7Qsn40Nn6KS5k8C2Ouvfa/Y/gUt4xUytRqbV2xcgYRQfB3AOn+UYBJ3UeWivPVY
	x5nm6qzzkRhNm6F1CiedLgz6Hfidvbd+++pnJNHVRL2mDMgM49hzd+odEB8pkvmkmYJS6jBEGsJzB
	d7f/XR3M/YtA5NB8OCapwDpiaFByI/XVo5E0fwODe5RCZ4iukOnwUNumXNaRej2hbWLmElVhx9tYr
	OJ5kZbOL80Tr3BghWXFO3NMqaJwvOy/TDdw8RvkMAn7AvmeD79sunsKXxyg3wnNYgumQyLP3gbo4Z
	6bCWzJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2EbF-00HCzZ-1B;
	Thu, 25 May 2023 17:18:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2EbC-00HCyp-2t
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 17:18:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E15A647C8;
	Thu, 25 May 2023 17:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C925C433EF;
	Thu, 25 May 2023 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685035081;
	bh=01eRIOZ7bYxYaUdJayYuJzz1CMZSZWiRLMpxEYaraRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deDxfVQ/lRbxnPB3XmXYbvjtgu3esTjjcfVUBzWOD8usSF6+iJgOiN9Ihnj/iJeeJ
	 SoXOQTbMhM7Aciq3YfZ8zPDgxS7Gcgrhiw0od2BJ22IrZ5P8pNBzOVED8owFrPIxF5
	 55HRuoHYzJ2KnS0ETYRn1vkQjCv7am6wrFcR76UPQPCVld4SYhktoD3TLGp7vIagfe
	 vwD4saFF28KvbpnlPXz0APK/7ST4Oi+iGnUvPsBx+iyhSnzsMThky2PcF9DhOmY13u
	 7SWKcLW48eQ1+UKZkUakRtab3KggYl/nFm+uXpmcx7wbwmA2RMf55zjfeUQZIgmT3b
	 +ts5J2Oq3a11Q==
Date: Thu, 25 May 2023 18:17:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 RFC Zisslpcfi 15/20] sslp prctl: arch-agnostic prctl
 for shadow stack and landing pad instr
Message-ID: <8ed76335-f87f-42e7-85b0-94a6e2b2cc3f@sirena.org.uk>
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-16-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230213045351.3945824-16-debug@rivosinc.com>
X-Cookie: Your step will soil many countries.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_101802_971976_314D7F5B 
X-CRM114-Status: GOOD (  11.84  )
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
Content-Type: multipart/mixed; boundary="===============1138814697556228161=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1138814697556228161==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vm+ay5gteDFPAYRx"
Content-Disposition: inline


--Vm+ay5gteDFPAYRx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2023 at 08:53:44PM -0800, Deepak Gupta wrote:
> Three architectures (x86, aarch64, riscv) have announced support for
> shadow stack and enforcing requirement of landing pad instructions on
> indirect call/jmp. This patch adds arch-agnostic prtcl support to enable
> /disable/get/set status of shadow stack and forward control (landing pad)
> flow cfi statuses.
>=20
> New prctls are
>       - PR_GET_SHADOW_STACK_STATUS, PR_SET_SHADOW_STACK_STATUS
>       - PR_GET_INDIRECT_BR_LP_STATUS, PR_SET_INDIRECT_BR_LP_STATUS

FWIW I had something very similar in my in progress arm64 support for
GCS (our equivalent feature), though without the LP stuff as we don't
have that.

Reviewed-by: Mark Brown <broonie@kernel.org>

I'll pull this into my branch and redo things on top of it if that's OK,
seems sensible to avoid collisions/duplication?

--Vm+ay5gteDFPAYRx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRvmEQACgkQJNaLcl1U
h9DOfgf5AcCEl1dHBhGVUZq2+USwzCjItL+iBBoYEIXuo4NGV8wdR+Tw8uzRNp2+
d8kPCAXVYTYqlVVa3mWVVq+ERkiThqk6y4g78/Atj0eOeBF8sWjSsJelSe8uCvIR
Id3zGELslcknllMUj/uQcsSIZJ6Sk/sdZmD8gmi3ai+DuxEiHiD4stZQgsasGxdj
uSHKvSxUj5C3A1+GNEqPeWSS8JVllNbtoWwJE5KqSL+FCSSW/JzPpUvE+TD+jJKy
bD9BFOIrXcz8R+D/VedYQstC7CaV0k3szsGWryl5Ja/5ORQu8KbxwS7DbZYkLsWM
aCg4iyY9LlLy+4GwFokt4gmFe79c1A==
=epZt
-----END PGP SIGNATURE-----

--Vm+ay5gteDFPAYRx--


--===============1138814697556228161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1138814697556228161==--

