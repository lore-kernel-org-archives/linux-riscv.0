Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E03DC79FB6
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOJWsccWxGz1FXBo6hLcU/Xoo5xIz/qn1OjoyZK3aQw=; b=w8qXRHua878lXDwLNcF1eesQJv
	O+cvFVJximFnvTGLIAfm6iki32gZVT3LOekmk1DICjCNlJznmTkzenhLj3lcT0SxlkVRNwBHt2eJr
	yCch9Wv16egXSpFbBuyi2mNqDqOGfMR9O0Y+gYHwnWhd5UJbTDAlhCOZqslOsWNb9Mu/1xGzXLhk8
	olBxY04PWFHMwhvzC1U79g79kQ9wuhIQuflznVverS+vJd+illbPvYcrawWBOTfsJid3PcCn3Qx/H
	+6p/BCnhqe1u9eeiEfKsCTMlxd6aWLTod8FeHwgkCHuxlLLz/hEgAgjAHXYzTDuQmJ6q376+9VDSi
	bigyRFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Jvs-00000000joo-2i64;
	Sat, 12 Sep 2026 09:22:00 +0000
Received: from out-251.mta0.migadu.com ([2001:41d0:1004:224b::fb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Jvq-00000000joM-062C
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 09:21:59 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xusJf5PESRwcD2i13JAzwFEVs0sWpCvaZYs59zxBFCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789204916; v=1; x=1789809716;
 b=VbvWflgZY2CdgD1mWnEq8P1AUf2W/B57gXTBxYgAoLZJWENYqST0/E0ar9i5tBjP8zag4YRt
 twJ80e89bEbU4SWfxhbdVJmyIbzXzknKJACDCNEGu3z4F16YHUjVYdAGG4I6m9ddam52AmvVWuh
 9NnNbam9El5Vm17+VRVdFoqY=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 92fe4840e74d5e8c;
	Sat, 12 Sep 2026 09:21:56 +0000
X-Mizu-Trace-ID: 92fe4840e74d5e8c
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Sat, 12 Sep 2026 17:21:46 +0800
Message-Id: <DLD87F4KVA70.JK2UTB6A9HZF@linux.dev>
To: "Guo Ren" <guoren@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Andy Chiu" <andybnac@gmail.com>,
 "Vincent Chen" <vincent.chen@sifive.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Palmer
 Dabbelt" <palmer@rivosinc.com>, "Greentime Hu" <greentime.hu@sifive.com>,
 "Heiko Stuebner" <heiko@sntech.de>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Kevin Zhang"
 <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
From: "Troy Mitchell" <troy.mitchell@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
 <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>
In-Reply-To: <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_022158_291641_D3925C4B 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: multipart/mixed; boundary="===============6065409473359424283=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6065409473359424283==
Content-Type: multipart/signed;
 boundary=85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 2:56 PM +08, Guo Ren wrote:
> On Tue, Sep 8, 2026 at 9:03=E2=80=AFPM Troy Mitchell <troy.mitchell@linux=
.dev> wrote:
>>
>> The standard vector save/restore asm advances datap but declares it as
>> input-only. An inlined caller reusing the original pointer may therefore
>> use the advanced address instead.
>>
>> Declare datap as read-write so the compiler can preserve the original
>> pointer when needed.
>>
>> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore pe=
r-task Vector state")
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> ---
>>  arch/riscv/include/asm/vector.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/ve=
ctor.h
>> index fffe72a772080..c7fd6d50a7a47 100644
>> --- a/arch/riscv/include/asm/vector.h
>> +++ b/arch/riscv/include/asm/vector.h
>> @@ -230,7 +230,7 @@ static inline void __riscv_v_vstate_save(struct __ri=
scv_v_ext_state *save_to,
>>                         "add            %1, %1, %0\n\t"
> Yes, %1 is modified. Good catch!
>
> Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>
>
> PS:
> Don't forget "if (has_xtheadvector()) {" part, thx :)
The XTheadVector path copies datap into t0 and lists t0/t4 as
clobbers, so it doesn't have this issue. Thanks for the reminder!

--=20
Troy Mitchell


--85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqUZqyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+xZwEA+t8LkOK2u846
sWTr9TB4DTrxQaZhXCLSCcAN6skfy0IBAOcbizQTGtps1f7cR6Su5Am/pgwxKYWX
EJuH1zNJG/MN
=E6bw
-----END PGP SIGNATURE-----

--85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50--


--===============6065409473359424283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6065409473359424283==--

