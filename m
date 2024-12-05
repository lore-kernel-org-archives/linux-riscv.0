Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04397E7716D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 15:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VCBZYiaH6EixfuxJxpcy3UOrmD3Ub9jduh7Jt/1ccU=; b=cSEqpH9HqK4mDv
	5AGb9ehB0CNMXDgXq48FXNy2f2DPTRvhEVlCAKCbQ5mekLfvJiIdTbHPpBUJwi7ae73Eg0T13hiUr
	1MiuyrxL/Xsky63v2JwCNUwUZbsTaBqUrfhwxB48RrD7af0H1cKQXCL87wzta/vpSODzSFhwzL3Ua
	6XtRQMvEkyC6GSAfQku16MzwCks3ealZSncZxGgXBViVhtEUjM6ohVTzaANyXy1kGXjCZPeIPQ554
	O8egWXuT2KRMlNtaeP+LDhSF3es3ajZfX2AUBopsA4F+T55NoSo6gx1eKbK2C/JESLiMCwrSz02/H
	KfbwPblZNMD+YGBNWV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDZD-0000000GUZ4-29UD;
	Thu, 05 Dec 2024 15:14:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDZA-0000000GUYD-3jSi
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 15:14:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29723A43DC2;
	Thu,  5 Dec 2024 15:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91566C4CED1;
	Thu,  5 Dec 2024 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733411695;
	bh=RMUj/5o73a3VTd92n6FV/UyHrDE6kEqc5g/3JcQECCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TGHjwKg/VodEe/EVR+/3YQqVaBDDsw5jqeYOs8Ik7VjuhN+Z+j/PcJltk6vnjbc6+
	 5BnC0neWDgvFF4L78BB5TrWopXTPVIpMdwnw4A6FGrLJWAMqVMSaXdxbnjHvYR/REq
	 VJSb8CYpkIcUHv+B8YOVRZVDxSZGKzlY1elkm5F2Spzs+MalN1g3SKGFB1sYGUsLLx
	 CJ92SG4v1Deylas9DelaLAv/SpbZlSDwZG0OaEbYa3AkMFTljcReoTldZDdN5OBwwH
	 gfdmICJsILxCdersUt8H411O+lArM6u+La+vP0za84i+tsnhbutISTsvVdx5q98eOi
	 BPRGj5NBicraA==
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()
Date: Thu,  5 Dec 2024 15:14:45 +0000
Message-ID: <20241205-rumble-engulf-7e51eeab2668@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118155354.697411-1-valentina.fernandezalanis@microchip.com>
References: <20241118155354.697411-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+yZkvIu+8afiH2E2mnEsGT0nnT9pwafXhP4l7o3wDVU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmBh1P7l3k80DshrvS5MLR7kuXG4qqf+berd2oarNU8b Xh+4/SbHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIlB7DP8uA8q8ss6efYv8T t+vzmgozo/WL9+cU72wsCtpfPjU/uYKRoUckmHPF/OjXP27N+tw7IcCgwpHzjtHs/xvLgiaWf73 iywUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_071456_991899_95EDD24D 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 18 Nov 2024 15:53:54 +0000, Valentina Fernandez wrote:
> To verify that Auto Update is possible, the mpfs_auto_update_state()
> function performs a "Query Security Service Request" to the system
> controller.
> 
> Previously, the check was performed on the first element of the
> response message, which was accessed using a 32-bit pointer. This
> caused the bitwise operation to reference incorrect data, as the
> response should be inspected at the byte level. Fixed this by casting
> the response to a  u8 * pointer, ensuring the check correctly inspects
> the appropriate byte of the response message.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()
      https://git.kernel.org/conor/c/48808b55b07c

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
