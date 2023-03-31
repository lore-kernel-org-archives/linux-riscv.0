Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B351CC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiQNlI0/QxH36XoTmMcf6LWxrpjbIvxspI6HoapO3zI=; b=mqecev8p2VZd/7SNWAkhRWhlr0
	Upd3m5WwJIEuRWMWw1mWPx9eXlB3lpEvZ30wYLzPPr6kZhkj3sF6XXG7wpaf0iw+OiPi81j2SLpMo
	wYay7tloxIxFTSMB0wscMtaDgR9r6cZ8uSiuA/wJuMuXfOTk+k37vj3C/xHxZ0m/zRB0+h86lJH9R
	isu4HxOvqfpv/sl6WEOxBqjnSFNDntjq/ms2XMFF84h/ofaRcLk+hBRo0IgpgOdvHTlgaBhkugWxx
	zOK2lPylrG3nciiu+wpeYfHA2HkzLEjjA7MpTucj+Oi4t0IlTg+YOhlPVjzDCSuT91Arg5e5fDs7b
	whfw5dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJaD-008TI7-30;
	Fri, 31 Mar 2023 18:34:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJaB-008TH3-1D
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 18:34:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA79462B39;
	Fri, 31 Mar 2023 18:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53E8C433EF;
	Fri, 31 Mar 2023 18:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680287678;
	bh=cFHZKXBfF/aAqc3Fsp181F2WteOHfwqXMSb2SVo24wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ea8m8/H+V5fiadF+7hEBnBK3lItvH3lvCfCUguyEM5G7pmgTYTFrJiQusiFvEg8mN
	 3lkVKNXzoZR2jvkUUlxTq6g6/+UbneQxcOrLby7z37mR5VPxvB+GTpdRBulVUL0lp4
	 4ZnJ2ipVCUS1vGBi3BwiA0hCIVhdeiVTfngniubtBW8pEo6UuwM+2nUIfraH0L04Xb
	 gy1HcfzVUh78BAdlRfhC5DCTGFrALl3/VzWIJxKQzAZy2jERt/OGJBn5+QmwONQsh4
	 qvn8ghtm3E3JVeHuzcDOYdAWBOEg/rzaRRFJbXNVclLedWRh9ZO2NDQICIAFNWKbx8
	 BtR9TkzaQDyrA==
Date: Fri, 31 Mar 2023 19:34:31 +0100
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, ben@decadent.org.uk,
	bjorn@kernel.org, palmer@dabbelt.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Yipeng Zou <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
Message-ID: <60ee7c26-1a70-427d-beaf-92e2989fc479@spud>
References: <20230222033021.983168-1-guoren@kernel.org>
 <20230222033021.983168-5-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230222033021.983168-5-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_113439_501637_5CF21036 
X-CRM114-Status: GOOD (  15.42  )
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
Content-Type: multipart/mixed; boundary="===============2694389199421979730=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2694389199421979730==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2r0N5+2Ft3yyCaRu"
Content-Disposition: inline


--2r0N5+2Ft3yyCaRu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:30:18PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> This patch converts riscv to use the generic entry infrastructure from
> kernel/entry/*. The generic entry makes maintainers' work easier and
> codes more elegant. Here are the changes:
>=20
>  - More clear entry.S with handle_exception and ret_from_exception
>  - Get rid of complex custom signal implementation
>  - Move syscall procedure from assembly to C, which is much more
>    readable.
>  - Connect ret_from_fork & ret_from_kernel_thread to generic entry.
>  - Wrap with irqentry_enter/exit and syscall_enter/exit_from_user_mode
>  - Use the standard preemption code instead of custom

This has unfortunately broken booting my usual NFS rootfs on both my D1
and Icicle. It's one of the Fedora images from David, I think this one:
http://fedora.riscv.rocks/kojifiles/work/tasks/3933/1313933/

It gets pretty far into things, it's once systemd is operational that
things go pear shaped:

[  OK  ] Mounted Huge Pages File System.
[   70.297439] systemd[1]: Mounted POSIX Message Queue File System.
[  OK  ] Mounted POSIX Message Queue File System.
[   70.453489] systemd[1]: Mounted Kernel Debug File System.
[  OK  ] Mounted Kernel Debug File System.
[   70.516331] systemd[1]: Mounted Kernel Trace File System.
[  OK  ] Mounted Kernel Trace File System.
[   70.679253] systemd[1]: modprobe@configfs.service: Succeeded.
[   70.788400] systemd[1]: Finished Load Kernel Module configfs.
[  OK  ] Finished Load Kernel Module configfs.
[   71.501222] systemd[1]: modprobe@drm.service: Succeeded.
[   71.573295] systemd[1]: Finished Load Kernel Module drm.
[  OK  ] Finished Load Kernel Module drm.
[   71.825934] systemd[1]: modprobe@fuse.service: Succeeded.
[   71.886945] systemd[1]: Finished Load Kernel Module fuse.
[  OK  ] Finished Load Kernel Module fuse.
[   71.991932] systemd[1]: nfs-convert.service: Succeeded.
[   72.034674] systemd[1]: Finished Preprocess NFS configuration convertion.
[  OK  ] Finished Preprocess NFS configuration convertion.
[   72.148778] systemd[1]: systemd-modules-load.service: Main process exite=
d, code=3Dexited, status=3D1/FAILURE
[   72.256659] systemd[1]: systemd-modules-load.service: Failed with result=
 'exit-code'.
[   72.337818] systemd[1]: Failed to start Load Kernel Modules.
[FAILED] Failed to start Load Kernel Modules.
See 'systemctl status systemd-modules-load.service' for details.
[   72.410491] systemd[1]: systemd-modules-load.service: Consumed 1.463s CP=
U time.
[   72.496739] systemd[1]: Condition check resulted in FUSE Control File Sy=
stem being skipped.
[   72.513689] systemd[1]: Condition check resulted in Kernel Configuration=
 File System being skipped.
[   72.682549] systemd[1]: Starting Apply Kernel Variables..
[  OK  ] Finished Apply Kernel Variables.
[   76.314434] systemd[1]: Finished Load/Save Random Seed.
[  OK  ] Finished Load/Save Random Seed.
[***   ] (1 of 6) A start job is running for=E2=80=A6p Virtual Console (14s=
 / no limit)
[  OK  ] Finished Create Static Device Nodes in /dev.
[   79.787065] systemd[1]: Started Entropy Daemon based on the HAVEGE algor=
ithm.
[  OK  ] Started Entropy Daemon based on the HAVEGE algorithm.
[   80.186295] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[   80.713508] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
         Starting Rule-based Manage=E2=80=A6for Device Events and Files...
[  *** ] (2 of 7) A start job is running for=E2=80=A6 All udev Devices (17s=
 / no limit)
[   82.939347] systemd[1]: systemd-journald.service: Main process exited, c=
ode=3Dexited, status=3D1/FAILURE
[   83.032046] systemd[1]: systemd-journald.service: Failed with result 'ex=
it-code'.
[FAILED] Failed to start Journal Service.
See 'systemctl status systemd-journald.service' for details.
[   83.210041] systemd[1]: Dependency failed for Flush Journal to Persisten=
t Storage.
[DEPEND] Dependency failed for Flus=E2=80=A6Journal to Persistent Storage.
[   83.254122] systemd[1]: systemd-journal-flush.service: Job systemd-journ=
al-flush.service/start failed with result 'dependency'.
[   83.272366] systemd[1]: systemd-journald.service: Consumed 1.443s CPU ti=
me.
[   83.334360] systemd[1]: systemd-journald.service: Scheduled restart job,=
 restart counter is at 1.
[   83.427839] systemd[1]: Finished Setup Virtual Console.
[  OK  ] Finished Setup Virtual Console.
[   83.510650] systemd[1]: Stopped Journal Service.
[  OK  ] Stopped Journal Service.
[   83.554417] systemd[1]: systemd-journald.service: Consumed 1.443s CPU ti=
me.
[   83.576573] systemd[1]: Condition check resulted in Journal Audit Socket=
 being skipped.
[   83.904878] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[   85.752090] systemd[1]: systemd-journald.service: Main process exited, c=
ode=3Dexited, status=3D1/FAILURE
[   85.826421] systemd[1]: systemd-journald.service: Failed with result 'ex=
it-code'.
[   85.876165] systemd[1]: Failed to start Journal Service.
[FAILED] Failed to start Journal Service.
See 'systemctl status systemd-journald.service' for details.
[   85.952221] systemd[1]: systemd-journald.service: Consumed 1.355s CPU ti=
me.
[   86.002092] systemd[1]: systemd-journald.service: Scheduled restart job,=
 restart counter is at 2.
[   86.015081] systemd[1]: Stopped Journal Service.
[  OK  ] Stopped Journal Service.
[   86.076429] systemd[1]: systemd-journald.service: Consumed 1.355s CPU ti=
me.
[   86.089700] systemd[1]: Condition check resulted in Journal Audit Socket=
 being skipped.
[   86.390162] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[   87.904427] systemd[1]: systemd-journald.service: Main process exited, c=
ode=3Dexited, status=3D1/FAILURE
[   87.950259] systemd[1]: systemd-journald.service: Failed with result 'ex=
it-code'.
[   88.000661] systemd[1]: Failed to start Journal Service.
[FAILED] Failed to start Journal Service.
See 'systemctl status systemd-journald.service' for details.
[   88.079953] systemd[1]: systemd-journald.service: Consumed 1.316s CPU ti=
me.
[   88.128956] systemd[1]: systemd-journald.service: Scheduled restart job,=
 restart counter is at 3.
[   88.145365] systemd[1]: Stopped Journal Service.
[  OK  ] Stopped Journal Service.
[   88.189975] systemd[1]: systemd-journald.service: Consumed 1.316s CPU ti=
me.
[   88.205799] systemd[1]: Condition check resulted in Journal Audit Socket=
 being skipped.
[   88.514817] systemd[1]: Starting Journal Service...
         Starting Journal Service...

(Note, you need to merge -rc2 into riscv/for-next to actually boot)

Cheers,
Conor.

--2r0N5+2Ft3yyCaRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCcntwAKCRB4tDGHoIJi
0mArAP4pqQMIediLrvbLgu1Oy1INpWVZQ5I6KGzgbid6ph2Y1wEAkH+kN4Fi9RCj
xtvqiZXfW4Als+2R4FJMyfQbcFDQGw8=
=rXo/
-----END PGP SIGNATURE-----

--2r0N5+2Ft3yyCaRu--


--===============2694389199421979730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2694389199421979730==--

