Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AE0D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umiAGWDZCnXtidBuqt4QffgnRdBKiqwFYtFrcCKehPk=; b=GWBkT8n5pRtGbw
	LMwHtPtmioHENMUDQM5T8bZrfCk0dv1hNVEac0HyUjnY8mDYxBo3BWNDTBy7Rd3I8uNEYd6EiBSyu
	f+QKgYu97ChW6w0j+RG6gkhRzmPkmc0whUsltKs0Ujcw9pv/fHpdJMqDCeE7CtbwNpY5IG1woW/Hl
	G0pavHnJce9BjbHz6iibY4KU2zbg8FdxSwlIS2g7b4LtvK4tkCh5/4L9bJ+7GelrvZ3jZhcKbvvNb
	I98sGNpNt8tWS6hIjrn6lG3bGFjdEywI0fuZk+5v5Q84Dw+0i+T5nAiu9vuFrJOzSMdIIYCTReWQo
	8OJl94G07+/+kHAPi1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8iq-00000003aSc-0Eke;
	Tue, 20 Jan 2026 10:12:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8ip-00000003aSR-0awh
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 10:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90DFD60008;
	Tue, 20 Jan 2026 10:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6444C19423;
	Tue, 20 Jan 2026 10:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768903946;
	bh=Zl0EKiX/vDiGriw8Csf4K6DbilEEJTuZv+esRqz9RV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJqHM+qrlsFxzvU5PfoSZMk0yau5k4To/SOce72gwQHGF9Bp5bqjOdXiSE/wvePXf
	 ZKVrqbgKTk8WtX9YlMv0F01flen843N1+lXC/bf2emOHP0IjJ3+bInHA+og4e8y/Gs
	 kVfDBltHb3mav2HykfFTSrTPIJkCJQgFvpwd1HKp7wW91hoxRNuAwTrb+5t9cpH7/5
	 W7SoC5N8hQ73lmn9PvY/x72YlEypXQ8mwz/kH0onseWS6xukT8EBFyr1+/tH82t73o
	 hqM2cyUaANs8nEkfLV71BAXwsaA5aIMYbpRdjEfPP1ZdVOUO+TR0OnPSbC0T4YIoII
	 n6SIvs0MsM5YQ==
Date: Tue, 20 Jan 2026 11:12:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
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

On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> Document the internal ADC and DAC audio codecs integrated
> in the Sophgo CV1800B SoC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
>  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++

This is not what I asked. I did not say squash patches. I asked to
squash into the binding. COMBINE the bindings. We do not need multiple
documents.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
