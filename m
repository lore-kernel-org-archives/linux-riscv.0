Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D02EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guUeGJagroH3h6pLhonox2G/BqKOEznJiWXOLnPHHG0=; b=ZZWfGj6R2m4KJoPImtNI9arG3l
	hj9ZiF6gTCpF6H0Xdi4922aeB5v7f9KpDRPTryTnf+WObX02ZYgsHvA5His1ofV/rYnZ6zZYscUCl
	PglH7VR7xjP+cUYpgjyvQuyYFzaAgkkN6UZXLOi3svd5wxGdRNBSgcBfBA3PRtlmkxNC9PVmaZrLK
	5lFLv0QXS1qTRsDN22R3fWlBfP2iUzMa5smgAckA4kWlIcS9MRjFPqpQhAZwWJNhi+3sq55vbUtOp
	9cmH576kznV/O8YT8G0G0QyJuHcuhSdU47XDe+YWFX11NiQnIsTXIWCVsBrBr6eeUqdM+MTN/GXqv
	47HSOgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJDL-003OfS-2O;
	Mon, 17 Jul 2023 08:04:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJD2-003ObB-09
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689581035; x=1721117035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kP478oPhO3PO54sMuk0Whiq+DCboJgHaMfLMwkOLgOs=;
  b=Bj6MKd+3pwS0QnlGbE5neQjpwNdrzhdhkuCrLGwaAtqBVoZ8D0I8qYne
   4Lwvc5Au2XXtwzan3rdDPX5aj/uEnZc132eQ3XV/0OPMHoLX9++JjQ8CD
   jDeb+aSywOdPGRJGSsg2bO5CEoQTtJy23lHKqFcFQ/6e08saBdttDdbW/
   1hWdvVjm8ORz6llTkNnymuEN/sdJQdA1Si8cscsnox4Sn3YvgL5+9WuEW
   ykXSpSAtGxn40grPIiiSco2ZMBWzd58w8CAetasXnm4b9DHxHXKrMCqKg
   loKYlsimGJ80BT197SEMppeil3dkHdupPi28xee0bzaP7cqxiNqSCm5v7
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="223401307"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 01:03:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 01:03:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 01:03:45 -0700
Date: Mon, 17 Jul 2023 09:03:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <hanyu001@208suo.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<liaochang1@huawei.com>, <heiko.stuebner@vrull.eu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: kernel: remove space before ')'
Message-ID: <20230717-gummy-frisbee-2f7dbe9f9512@wendy>
References: <tencent_6B88A6697F6AB7CEBD04EEABA52ACDC66909@qq.com>
 <8ef63e3296f5628896f373d696a078f8@208suo.com>
MIME-Version: 1.0
In-Reply-To: <8ef63e3296f5628896f373d696a078f8@208suo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_010404_700728_F6F0A17C 
X-CRM114-Status: GOOD (  15.53  )
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
Content-Type: multipart/mixed; boundary="===============8805090207685466046=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8805090207685466046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L/2VYdryjTVOyFzm"
Content-Disposition: inline

--L/2VYdryjTVOyFzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jul 17, 2023 at 03:48:37PM +0800, hanyu001@208suo.com wrote:
> Fixes checkpatch errors:
>=20
> riscv/kernel/probes:ERROR:space prohibited before that close parenthesis =
')'
> riscv/kernel/probes:ERROR:space prohibited before that close parenthesis =
')'
> riscv/kernel/probes:ERROR:space prohibited before that close parenthesis =
')'
>=20
> Signed-off-by: ztt <1549089851@qq.com>

Checkpatch complaints that this does not match the email you sent the
patch from. "ztt" is not a known identity either, so that's insufficient
for DCO purposes.

Thirdly, the patch is corrupted, with tabs replaced by spaces.
I've seen a lot of "checkpatch -f" fix patches from 208suo.com people
across various subsystems over the last few weeks that are all corrupted
and do not apply. Please don't send any more for arch/riscv until you
figure out how to send them without corruption.

Thanks,
Conor.

> ---
>  arch/riscv/kernel/probes/simulate-insn.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c
> b/arch/riscv/kernel/probes/simulate-insn.c
> index 7441ac8a6843..60792c79b42e 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -128,10 +128,10 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned
> long addr, struct pt_regs *re
>      (((opcode) >> 12) & 0x7)
>=20
>  #define branch_imm(opcode) \
> -    (((((opcode) >>  8) & 0xf ) <<  1) | \
> +    (((((opcode) >>  8) & 0xf) <<  1) | \
>       ((((opcode) >> 25) & 0x3f) <<  5) | \
> -     ((((opcode) >>  7) & 0x1 ) << 11) | \
> -     ((((opcode) >> 31) & 0x1 ) << 12))
> +     ((((opcode) >>  7) & 0x1) << 11) | \
> +     ((((opcode) >> 31) & 0x1) << 12))
>=20
>  #define branch_offset(opcode) \
>      sign_extend32((branch_imm(opcode)), 12)

--L/2VYdryjTVOyFzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLT1wAAKCRB4tDGHoIJi
0riRAQC5x0bRrGl6P4BqE7Pp+DOZbmF0X73PbxpL8CQ3OQLu5wD+KlSkbuZfU55K
FyKYxpIKFpgkocwE27cbJKVW9svqQgE=
=iDgp
-----END PGP SIGNATURE-----

--L/2VYdryjTVOyFzm--


--===============8805090207685466046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8805090207685466046==--

