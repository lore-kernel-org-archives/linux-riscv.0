Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027CBC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 03:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipX1Gcblxpj05R0I1vVPmtRva+9TM5xOPp8halrtPXg=; b=h7MAnzDNhpeOIOZJ/MOqvEB0c0
	7oorueSTKvbeVV1NqjTnuOVkr1GfptqJYBM/FyttBn8knLxtWSgDXIX7b0iLwsQAXYxeq6myEVESn
	qnjnbSt+3miOCXXYUxxQzxvZXcrH+ly/rsGebKbLRxcBrgNFW4vgKbY672xQY7qVdVK/Hsn5U4nTP
	abRTpNvocL/53FclprILUXk3fPJDVTMhnUtQy1vPgG/bSNP0Gfj+tBad9xR4vo1tFxDu4N0Ux/hyG
	InTGRR55iwKU52v32AJlp+hzJ+Fk+bI4ufrC6Ov4CaoYDkSVDC4tYmEdiRd/8NaCCE0vfb32G0ly3
	1YC+IJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ZtP-0046En-Rj; Thu, 01 Dec 2022 03:05:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ZtN-0046CK-9L
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 03:05:42 +0000
Received: by mail-pf1-x436.google.com with SMTP id 130so621736pfu.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 19:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KK8O7jlMOI6W0R9voFxwxKYumGIiD46HV1X85X98DQI=;
        b=QUQP0wQHCAxNQFkYjTDu0PpMbOiP/ZuN3mBY8CvUoKnNQV5DqrztBnpcM+iQTXc5X1
         yG1yfxtnGXI244yiTRPuYjhRUtl5kpK0U8HOn2rCCqMV8fHpC/iywOX4UsADifmAtWMu
         h5du9ebjS5A5yb0hZio4RtnBJ4iujaH4bwK9g09pY8oKdubxyHQwYndDrcyDOUnkDxjJ
         t7iCEOm/fs2jR7iYN6zdv1rqVIRVDy3BowZRtVkS3386bIn5V7LQUKlNhmeMPRF710xk
         YLQdmtL9rcV1aPle1BQN1X7wOHApL9PzW8Dh+b2sW50Uxam6OjJKWmrzThAW2ci8DuDJ
         ghYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK8O7jlMOI6W0R9voFxwxKYumGIiD46HV1X85X98DQI=;
        b=VPq1Q/KgwdvExbkciRwTeykonqP8PlZ/5pv/WI1trG8qw1pgSiJ0zbCB7WzJAX+nmp
         HH4X490yMGKerbf3MpOAU8u/r9qAohf2DehAEgRewoye2j8XMHhP22czJBElwAt4Vlcp
         1Boao6MJrHnaMMy5ZRFeigFT49kb2DBszDQ8v23ZtxsWYYHlDyuZmxV7Wnn9vDl5W+6v
         zRUrWXFKQMH0x+Kq0+/uD8Ugw9F6vUYeHMiWaXiyYM9IztvLi/96B3mm4yYKYnMN3CJG
         ali5c1r8vI82NInpbJxkze/DM5u7LQhXkU5QOBFRPD1h4jfUzOeE9PH6fX6aCtjk7rdJ
         pQVA==
X-Gm-Message-State: ANoB5pmYAeaQf9I4rjUXmcLP0jjfTjWWIosnNsfwUSg7HB9V7q/FIHkz
	6ipEKUncJZNZ78RunkTqllA=
X-Google-Smtp-Source: AA0mqf5THWhiH7h71LhvkUzAxi/n2hYMpnESjjEKjTq9xoQUeY6v85Xjn2OS8C7UmdyoEdxcEMhehQ==
X-Received: by 2002:a63:5719:0:b0:476:ea7d:3ff6 with SMTP id l25-20020a635719000000b00476ea7d3ff6mr41097766pgb.73.1669863939326;
        Wed, 30 Nov 2022 19:05:39 -0800 (PST)
Received: from debian.me (subs02-180-214-232-12.three.co.id. [180.214.232.12])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090a674100b002191a64b5d5sm3781625pjm.18.2022.11.30.19.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 19:05:38 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id AC58B1042F6; Thu,  1 Dec 2022 10:05:33 +0700 (WIB)
Date: Thu, 1 Dec 2022 10:05:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
	aou@eecs.berkeley.edu, corbet@lwn.net, guoren@kernel.org,
	heiko@sntech.de, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Documentation: riscv: add a section about ISA
 string ordering in /proc/cpuinfo
Message-ID: <Y4gZ/KZz9rdYj/0r@debian.me>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-4-conor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221130234125.2722364-4-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_190541_345509_1267CA24 
X-CRM114-Status: GOOD (  13.69  )
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
Content-Type: multipart/mixed; boundary="===============7905532371215454721=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7905532371215454721==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gGADNEIMdohg5oZc"
Content-Disposition: inline


--gGADNEIMdohg5oZc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 11:41:26PM +0000, Conor Dooley wrote:
> +#. Single-letter extensions come first, in "canonical order", so
> +   "IMAFDQLCBKJTPVH".

"..., that is ... ."

> +#. The first letter following the 'Z' conventionally indicates the most
> +   closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> +   If multiple 'Z' extensions are named, they should be ordered first by
> +   category, then alphabetically within a category.
> +

Did you mean "most closely related alphabetical extension category in
canonical order"?

> +An example string following the order is:
> +   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> +
=20
IMO literal code block should be better fit for the example above,
rather than definition list:

---- >8 ----
diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index bc3c8ced644bcf..8005add855dc43 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -43,6 +43,7 @@ ordering, so for our purposes the following rules apply:
 #. Non-standard extensions (starts with 'X') will be listed after all
    standard extensions.
=20
-An example string following the order is:
+An example string following the order is::
+
    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
=20
Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--gGADNEIMdohg5oZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY4gZ8QAKCRD2uYlJVVFO
o8LXAQDg6voodFPTVXIYpNCPvF2HkaiCwmKqQbyxHuyY8letmwD9Efrm/nRjGJBW
Pgs+RY15Td/CNE2QL19Q3dU8AzkiwAE=
=aqlR
-----END PGP SIGNATURE-----

--gGADNEIMdohg5oZc--


--===============7905532371215454721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7905532371215454721==--

