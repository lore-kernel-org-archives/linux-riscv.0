Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AF3C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X2alM9zHXdX8g+faeu2Ds7S7yX6ljfm5VOfghPX6ss=; b=G+z/I5Q3SNA4+wfq/oyHGxG12X
	wKbGZX3UTnaS2hcB9f00UXHVDfgtbLlvUzkbrZQoSw86GMBdBeZihDp/GdkIKRFB2aS0Z7iYE82SW
	/ScCSVOEBF2JS50OldU+Nqjmptsqh2Epuxo/PGgsAg7OJQqn7shX+ieYmd/n3b2gN9VY17XxJng3/
	64xX3sbhmzGEtBtR03fmkSy1TAymatdlW8puPhn0u8glajnnjBEHmyPj7hqsaDlydZPh70GOAqQUj
	LZn8/yRNTGzcDwccCSCU9inVdkVfZi7CduNX2e7xQ9rlgwTe5KEkcdnzBiOc2t905ZJmBPwBftqzB
	wvx02pFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmNh-00Bvye-9S; Wed, 22 Feb 2023 10:29:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlo6-00BdhW-8p
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677059582; x=1708595582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2RqkXhBHRqKKh7yKN8gC72GWgC3HgxWAprIYnydv3Fc=;
  b=W5/NrWgYj+V/+2Ll2fybMVzZnrC86STEuaKSzVVAVmEqdpsdtHrkjb37
   yeoEFuvXL63KYh+7dHr4Io35/LivssX4YBjz2F/VKzibHApP/yHQxlMRG
   wT0JBG05nWhtVzWBP8GjRF4zNwwu7S41z0cR1H/J3v9GExgzAiJ6MFB6M
   dSAxDdSEVZye9eRcflMI54gePeMaHXShUvQ/w3OUvJvUYXELL4lhVMjui
   m4UIrwB604MYAs2ax6Y+2buYfLXow4IdgCFYPMWNcxf/9ulAkE3iGVpev
   uEtKPujUbeOfjyAp/JovvHA0+Xzf7gdgEv1EHHx6CzAx1UyYQkmHG4F4A
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,318,1669100400"; 
   d="asc'?scan'208";a="201788162"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Feb 2023 02:52:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 02:52:55 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 22 Feb 2023 02:52:53 -0700
Date: Wed, 22 Feb 2023 09:52:27 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <jan.kiszka@siemens.com>, <kbingham@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] scripts/gdb: add lx_current support for riscv
Message-ID: <Y/Xl2/pfGYq5e89y@wendy>
References: <20230222093730.1826523-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230222093730.1826523-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_015302_450539_AAF7AF67 
X-CRM114-Status: GOOD (  17.23  )
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
Content-Type: multipart/mixed; boundary="===============2406381285804302239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2406381285804302239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aifrjwnhPlKH9ODp"
Content-Disposition: inline

--aifrjwnhPlKH9ODp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Song

On Wed, Feb 22, 2023 at 05:37:30PM +0800, Song Shuai wrote:
> RISC-V uses the tp register to save the current task_struct address
> as its current() defines. So lx_current() of riscv just returns the
> dereference of the address cast via task_ptr_type.

FYI, there's already been some patches posted for this:
https://lore.kernel.org/all/mhng-bdcd75a5-e6d6-4090-8292-a32eb46e4464@palme=
r-ri-x1c9a/

That version already has review and ack tags from Palmer and others.
It seems to me that Andrew is the usual applier of patches for this
script, so I'm gonna add him to CC here so he is aware - but as it is
the middle of the merge window the best course of action might just be
reposting that patch, CCing Andrew, after v6.3-rc1.

Cheers,
Conor.

>=20
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  scripts/gdb/linux/cpus.py | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 15fc4626d236..6825a9834394 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -173,6 +173,9 @@ def get_current_task(cpu):
>           else:
>               raise gdb.GdbError("Sorry, obtaining the current task is no=
t allowed "
>                                  "while running in userspace(EL0)")
> +    elif utils.is_target_arch("riscv"):
> +         current_task_addr =3D gdb.parse_and_eval("$tp")
> +         return current_task_addr.cast(task_ptr_type).dereference()
>      else:
>          raise gdb.GdbError("Sorry, obtaining the current task is not yet=
 "
>                             "supported with this arch")
> --=20
> 2.20.1
>=20
>=20

--aifrjwnhPlKH9ODp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/XlzQAKCRB4tDGHoIJi
0tRLAQDG1U1qHvLWSIibUh10+p//HtrVXBHL8Wyta+Zbs0vsfgD/XVcfoiveLvdP
UT1+3Dmz6nKcFKElg0//KE/+lJOAtgw=
=5ZMg
-----END PGP SIGNATURE-----

--aifrjwnhPlKH9ODp--


--===============2406381285804302239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2406381285804302239==--

