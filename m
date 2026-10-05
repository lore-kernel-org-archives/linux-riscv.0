Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D60FCA5FF5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 21:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPnBJxUqtL8+MIc0loy24sRYUZZiih+375hIT4ZpV0U=; b=o8bb5jpzpqNj3zHmLusM7rOYpq
	loU+vNoMSCjtPqS+VqXPThECnGmWwJT0WloK6DDcUd+TErI1EpXrf5neHCFxFON9lEz8Lu5QGl6Hd
	IH3VMdSAmSIWyU2/jjL/TJeh1VES8wxadgsj/INcV+o+gnLT1s3HLuzo3lNScNpkZ5DWik2hbBIzc
	5fj79Zoj1Bbvp6baqdLvhVrmPtJc+5DNWGVxxcGZtSY2CGBHbVewGmkId/pU+HKLJlLx1gAnEpaV5
	yGrFqrTNw5WtcjpR3pQKXABAu+iMDXidmYkc864IjgNgy7gh2MTI8A+inaGumVMM710MECJqOThLi
	mBRkxpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqcR-0000000HDW0-31Zi;
	Mon, 05 Oct 2026 21:53:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqcP-0000000HDVD-1AgG
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 21:53:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMkb91971554
	for <linux-riscv@lists.infradead.org>; Mon, 5 Oct 2026 21:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BPwGOfHuRmccjFU/atXErY9t
	YKZ5sXf3uOO2o/Gtvso=; b=BrkX9Aa1fletisXMHiJLw4Si9yfWjvX9yH6+MB+n
	DonFfKslUhYTQ0+6+lBUcL+fxsmVfFTHbLlNhsUX3CvLwhxT1fhfNs6ucRA5f7xL
	BsVSwIe7O3Pix2Xpq6sL+Q0umddYigJZYkU15LomuEls9g8P2X5ndeBzKDGsFj1c
	a7HEuFSoUqGeRiJHzlpZG9IcTOqCbof1DZI7mDtZZps0+jeOfPq2N7WSp/uO2jSS
	w2Ttyv6lBj8NRKIRKOj5HiXf+CsawhoAtTGdrm7b1XE4t9tGNtUJwnGyioY6DtX9
	WSYYa79uA/W4ysMd3IqLrrvQZ5aYgisM15XbdKC7fOortQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkuh2qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 21:53:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a2035a4so6716696d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791237187; x=1791841987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPwGOfHuRmccjFU/atXErY9tYKZ5sXf3uOO2o/Gtvso=;
        b=aXo8OY07bUczA2oOQlGUo+/zaexnjH2lhYYAMgyb9e6xgLJDrQ8N2DFOo4ZE2q1oK1
         6OF8e+3ijIHaXGV9AAxxk5+OZk6n4JfjjyH2KHK7Xvl3wS7MLjMuXjGebnkqJXR6QUb0
         VzkO+kgsrJFs3dy9A5kzVWESIxCOleALSiNEcq0WosktPnXetOd7QQmppVy5kVoTC99d
         U0d9oON6fnUsQEF85B6XtEJ3DVhmY00MpSrwyQjr6S60ctQAzCpcJxtShJRmbDH1SzvW
         7DkeFqLe6CIQze6lXVv5xKXBqp9dyjQ9PSH6t6qnYYAK2s2Qmm2I65eZhvOqdWj2ILBP
         yzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237187; x=1791841987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPwGOfHuRmccjFU/atXErY9tYKZ5sXf3uOO2o/Gtvso=;
        b=G2SP7e8Nad4vaLpm6OViMrug5gxAGqYJ3T/ZH7W2YUEF6KPQwMYg9kotEoG5Ed8eh4
         dgC/zhLckIQUiq3GKuGLU38zMHStn21Ac5dPz0YjTOjLZa5ckhe6NJKKDfihSLWF7/CQ
         TuXNfBVXpbc+q62mv0OvSR3y4vqVIz17idrJwCrP+UH3a2EvWxe8gmOavfOGIQ0fzv30
         qwgsGG0UnNL979+49f93UNe6I38HbBq6juaKj6/8L1RvhOT0NaS7qr4QAYzYRurU+BSf
         B/Oqfcu4ZbJuTho+ws6XVML4v6snbAe8p0DdPn/KKzznnTD4YBX+tdHofnyxrGtSQiKX
         rHLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvOb/+Gwxf9g+QR2/RJhderEKKkrZMx8kQUyWEOMlUFhxt5rhqpBEW1JB1Ri81MusMNPdCoSGhiD2pjQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nNmv/gtgKFF5UMvV76U4vU4Uvk6jvc212qZud+pMtlQVZ8Iqbz
	vZFJwmdNgp4An9RCGAXHSi+4rn+pSxmyf12ekeGqV7SX9VTfnFTVYUgNvkJQVy9o7i0KTvdHJcj
	vbVWU38HazH6d+g83HmBFLxsfI3jQlN7ex01+FBlzEskVv20nlTi2HG7rU5Bb/ne+r2rowtvuBS
	A28fQ=
X-Gm-Gg: AYBFou28fTC9v1DHOaztWnCuYbr0vrULlWhC6WEgi/WGteiy/pjFHPSp2Q9Kkd0Si92
	ISgDmogF/O99fkkTqTatxYdACI09MzqhJa/thSqN3dZnZ9ZTCs75B3BOQ0C5Ux5vktPhAkJNYdw
	1/fK6m9iLfpXFDEzgFx/1UMI4Ak3E3xRglqkxQlK8kTB/gy3b6yFf4vHlPgKq36oWrDalnzmr0n
	J7IU/YzBYHpadDL+jkMtXr+hvBbdqiaT3i7vEQx6Cx1hltFRi8ViwmzWUMje3KTQuitW9MeVzOG
	POpkdxM5vA5U3NvEkaArZ/gunhEkf6MqbzKsiTkc3shG6WKGc92GUJFBJhrif7Pvw6dByGU5Z3P
	GMMzHewt7tu1ugQ==
X-Received: by 2002:a05:620a:711c:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93e85ff6e47mr169816085a.7.1791237186652;
        Mon, 05 Oct 2026 14:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:711c:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93e85ff6e47mr169811885a.7.1791237185973;
        Mon, 05 Oct 2026 14:53:05 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db04edsm21801155e9.11.2026.10.05.14.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:53:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 23:53:04 +0200
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
Message-ID: <asQcQIh56MV1OJur@lore-desk>
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
MIME-Version: 1.0
In-Reply-To: <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac41c43 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KWoxivdfoX57CmOC0t0A:9 a=CjuIK1q_8ugA:10
 a=HCU4Ot6V5InO-uz2qO0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: XUtNXURR6JG3-oJA3d22g18Ot39XrKn0
X-Proofpoint-ORIG-GUID: XUtNXURR6JG3-oJA3d22g18Ot39XrKn0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4NiBTYWx0ZWRfX2uZQEZC9JS25
 h6AEk1iaeTuTNS/wFWTcl27zi6DhU9tKEBzp+re1D+n4aT+Y4pbV+B+p/dk0gStyvZchI66qGYZ
 KJbnMZr585wrkw8pNW2vS+NZX0N4Ahk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4NiBTYWx0ZWRfX0ieRrmOoUjSc
 OC+tnzLVK+6Cxni07xlaXooYu8k74VBvVScuD+6NVyPQ7nDVRZOwYQCFsVjU0uA1byPsw56aFqJ
 pFlO0kuG/wCK2Rio/lLLfuFKc51v6FOwdzpufggpCGSrs1+wMJJYINN5/afq+USLmoCc6tfFPbE
 lplvf0QMBOCS8r30OaxSnT7LER8rsFD2KR5PhDpbrIYbpKCgBm+hnw3YFrgzZQ41z6Z+77KvPRq
 w9/84VH99FFBvBruPEX7jyOtBTbEjvI9+hSCX8NHeOEl9nx6RXoRbxBHwgillPzWLUz8uU+p9Md
 fs9OZIViWAsQqchfdepcSBA5tpOsCeCCuZv8tm3veJnWUpZV9aI5fP3gt5HFfkrS0QB/XVlnQuC
 lHz1FJNhTFpfR7sMGycGZ+9iDsPTgAt+/tkJR5JDYp5DyzwQYy/1BRlU51lg88IyM16IRq/wUzV
 rKtPcfwTdqO0BSfx7dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_145309_435796_129ADDA4 
X-CRM114-Status: GOOD (  30.67  )
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
Content-Type: multipart/mixed; boundary="===============6217231642125649528=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6217231642125649528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7q6TE+CPzeC67kd"
Content-Disposition: inline

--p7q6TE+CPzeC67kd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Sep 29, 2026 at 03:10:11PM +0200, Lorenzo Bianconi wrote:
> > stmmac_update_subsecond_increment() ignores the error returned by
> > stmmac_config_addend(), and stmmac_init_tstamp_counter() discards the
> > addend and system time programming errors, always returning success. A
> > failure to program the addend (PTP_TCR_TSADDREG) or to initialize the
> > system time counter (PTP_TCR_TSINIT) is therefore silently swallowed,
> > leaving the hardware timestamp counter in a non-running or partially
> > configured state while the driver keeps operating as if timestamping
> > were up. This matters for TAPRIO/EST offloading, which derives the gate
> > base time from the hardware timestamp counter.
> >=20
> > The same hooks are also called from the PHC callbacks: settime64 and
> > adjfine drop the error and report success to clock_settime() and
> > clock_adjtime(), so a dead PTP reference clock goes unnoticed by
> > ptp4l/phc2sys.
> >=20
> > Return error codes from stmmac_update_subsecond_increment(),
> > stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
> > settime64/adjfine callbacks instead of silently returning success. On
> > failure, roll back the partially applied configuration so the hardware
> > and the driver bookkeeping stay consistent, and report the reason
> > through the devlink extack. Also guard against a zero sub-second
> > increment, which would otherwise divide by zero when computing the
> > addend.
> >=20
> > Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
> > tstamp_config, systime_flags and tsfupdt_coarse) when (re)initializing
> > timestamping, so a failed init does not leave TX/RX timestamping
> > enabled on a counter that never started.
> >=20
> > Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to generic=
 HW Interface Helpers")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Do not run stmmac_config_addend() in
> >   stmmac_update_subsecond_increment() error path.
> > - Return error from stmmac_adjust_freq() and stmmac_set_time().
> > - Reset hw ts configuration in stmmac_init_timestamping().
> > - Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-added-systi=
me-error-v2-1-beb2a6b5f866@oss.qualcomm.com
> >=20
> > Changes in v2:
> > - Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
> >   routine.
> > - Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added-systi=
me-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++++++++++++=
++------
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
> >  2 files changed, 84 insertions(+), 32 deletions(-)
>=20
> Hello, I'm noticing that after this patch was merged into linux-next,
> boot seems to hang when ip=3Ddhcp is used because ethernet isn't working
> on the TH1520 Lichee Pi 4a. These lines get printed in a loop over and
> over
>=20
> IP-Config: end0 hardware address 72:ca:a8:eb:27:[   24.872982] thead-dwma=
c ffe7070000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> f2 mtu 1500 DHCP
> [   24.900412] thead-dwmac ffe7070000.ethernet end0: PHY [stmmac-0:01] dr=
iver [RTL8211F Gigabit Ethernet] (irq=3DPOLL)
> [   24.912780] dwmac1000: Master AXI performs any burst length
> [   24.912801] thead-dwmac ffe7070000.ethernet end0: No Safety Features s=
upport found
> [   25.010229] thead-dwmac ffe7070000.ethernet end0: PTP init failed
> SIOCSIFFLAGS: Connection timed out

Hi Anirudh,

based on the reported error, stmmac_init_tstamp_counter() fails with
-ETIMEDOUT. In particular this can occurs if:

stmmac_init_tstamp_counter()
 -> stmmac_update_subsecond_increment() -> stmmac_config_addend() -> -ETIME=
DOUT
 -> stmmac_init_systime() -> -ETIMEDOUT

I guess we should understand which one is failing and why it is failing.

Regards,
Lorenzo

>=20
> I suspect that this has something to do with the error codes being
> discarded in your patch/some particular quirk of this hardware where it
> doesn't support these PTP related bits.
>=20
> I've CC'ed the linux-riscv list, in case anyone here is more familiar
> with this particular board and knows why this is happening.
>=20
> Regards
> Anirudh Srinivasan

--p7q6TE+CPzeC67kd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasQcQAAKCRA6cBh0uS2t
rFnAAQDcxY180c8JdzZhXUdZiy4mLTHzGsUdBEmqQNWb/IZ3RAD9EiDEtq7DZiW6
fsK9fLcyL82F5PdP0FH5ODJSMtdl0QU=
=KEwD
-----END PGP SIGNATURE-----

--p7q6TE+CPzeC67kd--


--===============6217231642125649528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6217231642125649528==--

