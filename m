Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1866CA6001
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9idtpFtEbf3sYfMU32GYJSC1G78ZL/ivVCOW0w/qcfc=; b=tgcO6Kdyr8q66sumIIGHGDCHQH
	1N8elStHDefw+M99g7CEE3lhjwgNhA8Iw0hC9taDYZubI9ndpE+LMsu/51KTsqPoA0X78Wz0+7SG7
	cFLkNvtGyxCMHO2hm+WEeokPr26k49A5I5UepfPrPFJ6ebBbgDl2tt9w8wzAM/HEo5X/tk0cyVbUc
	b/2x4m0PSqMRB5DnK9pVGuhRn4V0JYtDMnwcNkUAxvhjep0VogW4uBIvO5E4GKtE3zQa5wc9U0PGt
	fUiTwFCixpWVtX2jDtSkw9LmIWROfKmC2bD65A10PGjHRBbDhNYNVuNYeKMu+j54KBZrWC4MQXs9c
	sm+B11lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6EE-00000000xD1-35yn;
	Tue, 06 Oct 2026 14:33:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6EC-00000000xCW-2TuG
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 14:33:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696EAvGi2065364
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 14:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dwpyPsnmPPkVa/yP5kcpaqW3
	Q1SBP+pZeLwP1dVZabo=; b=IWriEdRh39rHY7p1hhtRxbqDd01KEH081nPJB4A4
	xXUmZrixe5vjX20pP2Z+v4GhRaMrlDiyQsYKaKQ3i+G7XXPLYhd73j6baEb80vKv
	uHGQyn/R7M28jkPMncyOYxryqUF8aV367lZusPyZViJSDJIw6XApkvhQTp0R6kgP
	GCmnDZzCoilfAWSPxeQKbpHHc+ktHzHeptxx2B1fG9wEWsd8hmnYMtYw+v1TnauV
	cZ2+EIMvuFR3VsXVim37xbabn7gHktVfC9T+VoNt1HXb+7WnhlYn9/3xwTu3y/sV
	6lmPDPeQBiFcjQunXIp+10Uaj56U2kl0epKLFGH5niMgAw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc512e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 14:33:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf71bbf197so2621613137.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791297191; x=1791901991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dwpyPsnmPPkVa/yP5kcpaqW3Q1SBP+pZeLwP1dVZabo=;
        b=bf1hOE02Whx3Ig87bUZi997SoJHOMTlYvZvUKcSwdPHyPpq2Fr4xqBx8kIF9xSoe/E
         fT3U+wPt0AStlkTM9DWgBYuwEwTxdqqPj4/tp+8piOLxZH8lHaWUhr/5+3BTV+/hUZT4
         /72lVHQY5GRv9uVj6o4C5s85q6EMqe2S7vRwWFlaZe9mJcdGfKUMAh71HfE8zeGgCo5a
         chAmf/ChFbs2nQK7+HlD0rh2Z1dXFk7Xdi9hyUVFlm9ybaTVOmARSHLjXix4Xx8GfxhG
         a7R3r08D48Y9jZUqL76y9SwA/xXb3uOGvvMKn+xQVnnyHJxHYf2+XEYBVGQ7u0Snk1eR
         VMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791297191; x=1791901991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwpyPsnmPPkVa/yP5kcpaqW3Q1SBP+pZeLwP1dVZabo=;
        b=sFSS12P6U6bnnF10sZbXHVIR3BTiXxiAqDlPhs00k6Vb0adevBPc7450o6gGJE4E/S
         3UsPkzQUuGPzKcLQEsc4HehtSTstPhxkBRZgTxMNrim7qHnn3pBNLdwVMRlgogO/x/9P
         C65kXnMtYywJHQu0pNSYYhO07yPABpO1gedaBK5Iakv/W6B9DTqQAjeaBD74D4sxwjXd
         cqGXGm0d4xUUbloRQmTJZoLs4yKpKiaar2fTSjYS4KFE+WOUswpMDcWkiMGkDSawdhmg
         /BJakL/jnJQ55uTEZ6VAX3ubmqI8ymFHVXoSayYmaXOX1YqKP3fDyx/Py3jXSWSyueKI
         0f2w==
X-Forwarded-Encrypted: i=1; AKwUvBxCM17fdMpSuJL7B4ThuBgLQrA72xrb8Scm1Y0AQdIPzAmwxHaG2f78cSIRpz3V/GIIZKBbLgJLeYhQaA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKjWTI4+nysnrqrPjbz4a279JYqmMRtUCIFX5C6DLcsHv+b7sGN
	b7f2RcKPs2rkq/hef+wwgJYivfYQ9lFBUHXKo67afcdAqHmFFxk1A1Opt76Kkv/qmObSA5uQWXw
	2n9bUNSTMDlm1bkx5bF/J90eDOyBKXp3HtGxlXTJctMST3T9dcnGyl7ZsjoL0LKP0vu+uNj4=
X-Gm-Gg: AYBFou3O2rP3XyV3QgeAe9NtmRn6Ogk5UV4LVuxbLxdUEaIJ5U3pM3A7psVEUhvW72m
	VwJRR5bbx4FuvDpxkG6VQ6ke7z4QPIdKIkk2JMWQtTNgEQ0oGyet7NpP0v3id+nYDzBOurpHltj
	Vt+3pHXJZ6u95oxIPeWg9F7cC0pjhgmNPr5vsM3KXamcEYJ4b5Y0VKG4bv8Gwa06OLfM7O0zJWy
	r3/bRHwznzes8Zbksf85A5Cbk60GlrVH1XfJ+1FKd1SDeeDTo9BKJvxMCPjwmwVqzgOxncPH47X
	F+f+zcX51iUDKkM0+ZJDNiGhvhfrpQAymoyX34BZLE9DJeOmt/XAgzXut8qdqggK4FAZIszGFIL
	4jTuXroq97VHpHg==
X-Received: by 2002:a05:6102:390e:b0:7be:3606:2248 with SMTP id ada2fe7eead31-7c87c802aedmr557184137.34.1791297190532;
        Tue, 06 Oct 2026 07:33:10 -0700 (PDT)
X-Received: by 2002:a05:6102:390e:b0:7be:3606:2248 with SMTP id ada2fe7eead31-7c87c802aedmr557146137.34.1791297189508;
        Tue, 06 Oct 2026 07:33:09 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622d282esm10051964f8f.33.2026.10.06.07.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:33:08 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:33:07 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <fustini@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
Message-ID: <asUGoxyJWVcsYBWG@lore-desk>
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk>
 <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk>
 <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac506a7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Khk5uQurOxoZPgiQn0kA:9 a=QEXdDO2ut3YA:10
 a=oLeseYo1r3XBFyQ01TcA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NyBTYWx0ZWRfXyfkHNfmSLX3X
 bLX5xSQ577fe9nXzzUDw8LGKGGaSKMvKMMf6Fi58XGqGp1eCCkRp1YDJRrAwT5BpW1TuesvIebS
 FLpG2iTVkn69DFn0hKyF9mhyDAVkNYI=
X-Proofpoint-GUID: y8Rm7-WOy2EwNCMM4UB7MynJLzk6eEpC
X-Proofpoint-ORIG-GUID: y8Rm7-WOy2EwNCMM4UB7MynJLzk6eEpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NyBTYWx0ZWRfX3QAS1n9Xku8W
 FcfVJ6u/Su41WS2nt+NnBGfxfd46tcLeR3xKNaKKZT6nH85Cu3KoOqbFRNecKvLSGh7rzWKTi6x
 EX2q0u2yepgdbDgLcZCH6IjqtohxnpnP5vVw71C1jWVSarMWrVWZNwpGKLqBlGGMGj2jU7NCYun
 2EzOU83vNp+2RBQGsGFmvMPJ0cm3w/aNt1ElPElULYer7Da4QB3Pe5W4GL+hXSrKq7IglRTq18Q
 nzr53X4BKZhfiPSX9tljfH99f9hvz06BK5PSJZpFZO91FQ1mqbqCqTnBvPSKdxQLHmgVlBdWAy4
 vfBNv4SbqwDE0/+TMqSQdUotafxmq0QaQEagw+M/cED1sNlCGWRjxX+PfuRxA9GsYu3KHazVJ6z
 pacH9pP6dQIigNZVqAkHecbH8d0rcRbnFapMMWn3eZVpg+oluvna6PW/5C6WWrwt1DLz2IrX0IC
 41WPiGaJFvHgGXzfxRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_073312_661867_058533D8 
X-CRM114-Status: GOOD (  37.66  )
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
Content-Type: multipart/mixed; boundary="===============2555678608004540023=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2555678608004540023==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vsD1I/wWF+wv5J+3"
Content-Disposition: inline

--vsD1I/wWF+wv5J+3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 06, Anirudh Srinivasan wrote:
> Hi Lorenzo,
>=20
> On Tue, Oct 6, 2026 at 1:57=E2=80=AFAM Lorenzo Bianconi
> <lorenzo.bianconi@oss.qualcomm.com> wrote:
> >
> > > Hi Lorenzo,
> > >
> > > On Mon, Oct 5, 2026 at 4:53=E2=80=AFPM Lorenzo Bianconi
> > > <lorenzo.bianconi@oss.qualcomm.com> wrote:
> > > >
> > > > > On Tue, Sep 29, 2026 at 03:10:11PM +0200, Lorenzo Bianconi wrote:
> > > > > > stmmac_update_subsecond_increment() ignores the error returned =
by
> > > > > > stmmac_config_addend(), and stmmac_init_tstamp_counter() discar=
ds the
> > > > > > addend and system time programming errors, always returning suc=
cess. A
> > > > > > failure to program the addend (PTP_TCR_TSADDREG) or to initiali=
ze the
> > > > > > system time counter (PTP_TCR_TSINIT) is therefore silently swal=
lowed,
> > > > > > leaving the hardware timestamp counter in a non-running or part=
ially
> > > > > > configured state while the driver keeps operating as if timesta=
mping
> > > > > > were up. This matters for TAPRIO/EST offloading, which derives =
the gate
> > > > > > base time from the hardware timestamp counter.
> > > > > >
> > > > > > The same hooks are also called from the PHC callbacks: settime6=
4 and
> > > > > > adjfine drop the error and report success to clock_settime() and
> > > > > > clock_adjtime(), so a dead PTP reference clock goes unnoticed by
> > > > > > ptp4l/phc2sys.
> > > > > >
> > > > > > Return error codes from stmmac_update_subsecond_increment(),
> > > > > > stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
> > > > > > settime64/adjfine callbacks instead of silently returning succe=
ss. On
> > > > > > failure, roll back the partially applied configuration so the h=
ardware
> > > > > > and the driver bookkeeping stay consistent, and report the reas=
on
> > > > > > through the devlink extack. Also guard against a zero sub-second
> > > > > > increment, which would otherwise divide by zero when computing =
the
> > > > > > addend.
> > > > > >
> > > > > > Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
> > > > > > tstamp_config, systime_flags and tsfupdt_coarse) when (re)initi=
alizing
> > > > > > timestamping, so a failed init does not leave TX/RX timestamping
> > > > > > enabled on a counter that never started.
> > > > > >
> > > > > > Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to=
 generic HW Interface Helpers")
> > > > > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.=
com>
> > > > > > ---
> > > > > > Changes in v3:
> > > > > > - Do not run stmmac_config_addend() in
> > > > > >   stmmac_update_subsecond_increment() error path.
> > > > > > - Return error from stmmac_adjust_freq() and stmmac_set_time().
> > > > > > - Reset hw ts configuration in stmmac_init_timestamping().
> > > > > > - Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-add=
ed-systime-error-v2-1-beb2a6b5f866@oss.qualcomm.com
> > > > > >
> > > > > > Changes in v2:
> > > > > > - Initialize sec_inc to 0 in stmmac_restore_subsecond_increment=
()
> > > > > >   routine.
> > > > > > - Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-add=
ed-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
> > > > > > ---
> > > > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++++=
++++++++++------
> > > > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
> > > > > >  2 files changed, 84 insertions(+), 32 deletions(-)
> > > > >
> > > > > Hello, I'm noticing that after this patch was merged into linux-n=
ext,
> > > > > boot seems to hang when ip=3Ddhcp is used because ethernet isn't =
working
> > > > > on the TH1520 Lichee Pi 4a. These lines get printed in a loop ove=
r and
> > > > > over
> > > > >
> > > > > IP-Config: end0 hardware address 72:ca:a8:eb:27:[   24.872982] th=
ead-dwmac ffe7070000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > > > f2 mtu 1500 DHCP
> > > > > [   24.900412] thead-dwmac ffe7070000.ethernet end0: PHY [stmmac-=
0:01] driver [RTL8211F Gigabit Ethernet] (irq=3DPOLL)
> > > > > [   24.912780] dwmac1000: Master AXI performs any burst length
> > > > > [   24.912801] thead-dwmac ffe7070000.ethernet end0: No Safety Fe=
atures support found
> > > > > [   25.010229] thead-dwmac ffe7070000.ethernet end0: PTP init fai=
led
> > > > > SIOCSIFFLAGS: Connection timed out
> > > >
> > > > Hi Anirudh,
> > > >
> > > > based on the reported error, stmmac_init_tstamp_counter() fails with
> > > > -ETIMEDOUT. In particular this can occurs if:
> > > >
> > > > stmmac_init_tstamp_counter()
> > > >  -> stmmac_update_subsecond_increment() -> stmmac_config_addend() -=
> -ETIMEDOUT
> > > >  -> stmmac_init_systime() -> -ETIMEDOUT
> > > >
> > > > I guess we should understand which one is failing and why it is fai=
ling.
> > >
> > > It seems like both are timing out, both config_addend
> > > (PTP_TCR_TSADDREG) and init_systime (PTP_TCR_TSINIT).
> >
> > It seems hw timestamping has never worked on this board, it was just
> > undiscovered since stmmac_init_tstamp_counter() was not reporting any
> > error before (this is exactly the goal of this patch).
> >
> > What are the output for:
> > - IEEE 1588-2002 Time Stamp
> > - IEEE 1588-2008 Advanced Time Stamp
> >
> > root@rb3-gen2:~# grep 'Time Stamp' /sys/kernel/debug/stmmaceth/eth0/dma=
_cap
> > IEEE 1588-2002 Time Stamp: N
> > IEEE 1588-2008 Advanced Time Stamp: Y
>=20
> This is what I see
>=20
> root@debian-trixie-riscv64:/# grep 'Time Stamp'
> /sys/kernel/debug/stmmaceth/end0/dma_cap
> IEEE 1588-2002 Time Stamp: N
> IEEE 1588-2008 Advanced Time Stamp: Y

Unfortunately I do not have this board for debugging. The first idea
I got is maybe 100ms is too small for this SoC? Can you please try to
increase it to like 500ms?

Regards,
Lorenzo
=20

--vsD1I/wWF+wv5J+3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasUGowAKCRA6cBh0uS2t
rEqIAQD7DDlqWNVBPDIEAFYspmZfjvl0guPYJxd27F+u9+vZNAEAp3QY2fc2UJEX
9JJNT60hpgKxLeuzm+DCJ0ZdtVJbggs=
=6W7J
-----END PGP SIGNATURE-----

--vsD1I/wWF+wv5J+3--


--===============2555678608004540023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2555678608004540023==--

