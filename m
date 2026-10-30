Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889EB606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tiFawZr9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBeqOsCC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8NKc1a46b2WYdgjrbu9jAF21UVC0kfWXe6Oc9FOI8WE=; b=tiFawZr9P9Da+E9ly+rgq0haTb
	MeCu/pL++0grjkhhUL+8qjke52JBBALEo+Ee0flQSqyit6rAPficDu5v4blWgZILXOilc+UJ1OlFn
	OI6BSMHa/7Epoi7PL2bXBDgT0aiqmf2yxScdGeVbRBzRq65vnL0kCExfwOJf3tl/OX83MF5Xv1k3h
	DL/5AvQugIhGbYnl88zDraeGXYnHjFVBMqiyJHmjojmsOjPPyLKRzMNMtjNTrx+ZKJtGcR7/zIIqF
	Oh20ZNz+HkGNNdEBTlRgw8ehsAL6LaRsccqwS2kJIQOklTFXlNKxnJwpqtTIDMeGlrCjRyGp/JXME
	SjCo6xvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbRg-0000000AbuX-2iQQ;
	Fri, 30 Oct 2026 01:30:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbRf-0000000AbuR-3Pqj
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 01:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 390C6605CA;
	Fri, 30 Oct 2026 01:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA2A1F0093A;
	Fri, 30 Oct 2026 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323814;
	bh=EAlyTbjKYN2lw0612XbkOL/VuxaOgj87HW/JEa06j9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBeqOsCCAZ2dNxnclRIQidPIJfBlUVRfEjA/+v/gjvVRZQuuQJ6V8Ff1brZkl1Rdf
	 7BWy4kBb2TjCRnwKHad9uk7zNH2NbExcNN7imZOYrzagp3EHoimlWBvCi8ZRnbjh+m
	 C0Ii0ndWjm9yyVpL0L06uj1z+8kHXYhrzuBq3UpmiYe8kqE+2HwRB4sEDIQokI4VpA
	 5TPIU8ueZKhQVH4NwGx1Nw6pZ4JD5NjIj4iuad/N27+lkl8LEz6c8N7ehFZyenwmQ/
	 Gi6ODRrdA/MRXRWYx9vASGyxWje0N6DCVrwWEkg7Qa1p/rOHd2KOfL5UMqj8tItDUl
	 NEVjEQdPxxOJw==
Date: Thu, 29 Oct 2026 18:30:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: dts: th1520-lichee-module-4a: Cleanup with
 dt-check-style
Message-ID: <auPzJUkIQMLT7MOU@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-3-9a8810091d47@axis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002-fix-dts-th1520-v1-3-9a8810091d47@axis.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 03:43:35PM +0200, Kanak Shilledar wrote:
> Fix warnings thrown by krzk's recent updates to the dt-check-style
> tool when run with strict mode. Fix the following warnings:
> 
> 	thead/th1520-lichee-module-4a.dtsi:62: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
> 	thead/th1520-lichee-module-4a.dtsi:66: [required-blank-lines] "status" must be preceded by a blank line
> 	thead/th1520-lichee-module-4a.dtsi:129: [child-name-order] child node 'rx-pins' out of name order
> 
> After this patch, there are no more warnings left. Fix these warnings
> to make the file more readable and maintainable along with that to
> make it more compliant with the devicetree specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 56 ++++++++++++----------
>  1 file changed, 30 insertions(+), 26 deletions(-)

The subject is missing the "thead:" prefix. I'll add that when applying.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
