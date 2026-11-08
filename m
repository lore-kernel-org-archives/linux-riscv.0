Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAFB606A322
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5uaY0yz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDH7wkIO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ShBiJf71+8fQDU28Zmg0rGVb+FMxXvi3NQf3kmZhzwE=; b=M5uaY0yz8arZksfdR/9OInfYjO
	Z88ybHtB29UUW5uLNGih13LzLxjjNSIa4v1OSmi4il4TYvAUF8nPvTYJn1meRuZELuDSwJ0lFXVAY
	VA50MF1y2vfK6A8FwQT0GnXjMwAB/WRkAuGsFW9e+f6Lg/POTiWHkmDd4XS+NKdt8rHlimdwHcYm/
	cQ6CcDBseiE1o08fEebT409B8hBhSbrmdcwjkZ3ZTut3Y20KxBbDeiOrxkdmKmHRtGlM0G2mirkBn
	i1fb/FozamRqu2U1QqIllT6JmYsd6uq8l5Fr3y1v/NpFQEEfAMZ623AQZkkY0pgjUofhi8NomcjCU
	tC1BWNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAra-0000000Gloe-2qKG;
	Sun, 08 Nov 2026 21:55:46 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQArY-0000000GloI-2PJq
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 21:55:45 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1109566eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 13:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174944; cv=none;
        d=google.com; s=arc-20260327;
        b=fDzb7Qoob6VSQFh9RIstD+4+S30NgO9zhTUuPOqOKHodGCUyOEvjihfuzCJySrmDYU
         HrK+RdEH7BrlnvITQTrJGoKfYjtzn3XKcwRfY4M6y9uIMQ4vRvukDzhzqaRXuOPyahP+
         IGGe7ejXZFCXor3wqX+w0gyT7/WVl/TFow9xv6sHRtyg/JQDex9ayoP1qY/i56jkZVe2
         keYFdcAXFTtJBCgN9k1Xgm8nsQjfein+NdelMAasNKG5c6g9nNZsmXBb31Xesme9OXiG
         tjznIzwxVZaZq9qaVWHPEOPQ6x5Uy8K/WCIY0V/WYbjseUCOGCkxgA2TKqgj8ahA/QAO
         m2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        fh=HETiV9urUdqkY3naZXNGt6uVGeox41gSRiG1otiEDvM=;
        b=Scfny9GQ2UcOC5+LCvjFtvbFSqwn4TCeks4ge+Z5dS2K3tBsmAfK44hFNFulJKHeee
         E4X1A2pa31ylcJ4+eoc0KsdhD9kzGJ6HKzdns+o6Qe3tOffBS53CxEcFrxORw7jMyP8g
         9MQfXQCUorDn02q6LosYcJGd8qnXytxvYVAyYr9RH696XhxGa8t/JaOmBwXL0rFzR1FU
         SMvvyqMtWczpps65yKJQBMg83mQA+XAddCGT+6eHp8SdZO0n3nxdyRsjrXzAMqQxQvlX
         Hc2jF9ZiKOmPUdb7mDXBzR5DF/y2dF3r2BGOw1JWJFWTapZ4SfH7L+k9HXhhzFDD70OH
         VB+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174944; x=1794779744; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        b=WDH7wkIONllIsbzE0forfpiTuos9kZTzo1UAoKgfWTyJ4H5p+lPftYOBQ9xgwm1vf/
         xjTnbtSzK5j1cePlHCo9jt1P7dQciLt7I4NP0xVeL+wD/mO/O0RWMNwBPsJeqKCos9/V
         lFIbGWyd6ejeADDxmB6IsQ5ZkM5jfhkyzjHav71nNm4PpJOcrZHi9buopxBLGf5fbHNd
         Hrdbwwihm87HX7B4qVjZjQ+rxXFr3eql7Sl/R7nUn2oalBEbgsLiVqDYIkCBJ6FddU0D
         ElT1v6egHcnKQTwpN+Op8WLiC7WaHLOOysG2tv5mG42s5DBfSIye4yStS3I6jlwBiSNt
         qI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174944; x=1794779744;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        b=Wl3afr1PI1Iebo47XqtMXXPd00pWFiJrShazA/yB62hoT+STQI4YPdI2wwbh85aNKp
         fS+U6bGxugpdffOhB04k4fuGATBTjnPe2nlmhsbkjF0ZV1tWHiVuJsnLASEn6ZYY+Gpt
         KO3ZXPuCU32JkzLGTHbszkj2d7AJlUpPQzgvURnQP4DHcT+yidDAMmbY3VrivZ919O+E
         34M+UvzB+vzvCpH2fEQFpe4Z506LFVpN+cTHI4SKK2iHkYm+9SSjWSloJMFU45GO3aQ5
         75FvdGn8Q1YE1+mEdbMd/7qa198RwQwzvgq0FRRXjhCq5/T8oxgJypZEYysG6hT/DhZI
         lKyw==
X-Forwarded-Encrypted: i=1; AL+hErE/nZJA7ElXa5j/4k656B1XvUAE8vpnXRqf8oaagnFM4VJGZTLA7+6lDGUx1xECT5sr7iJtPXgxNBxaHA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9un+swSj3GyJsJXt9BIJQ4Qx//x0ZgO6UAzcDsHaQ3NY8HnYBo
	97Ym4ac9gNbfvfg5GZWLrzjjH9u34H0bS+oOaOwmUBoISOcHxakUi42EiGvTA0CYVbZmE+wdv2b
	vei6KsP/F05OYTQU2riSdJic9Usw9FiU=
X-Gm-Gg: AYBFou3/LcOt+hdLtcAxvQTt296LN2op+FsScrZSbag7U6Gow2B/ipAoaUrIosUpIZY
	j2MCAxiNHDg0PZ/p7XmWCSWytpT6hgKWWdUf5uk2E1U1L+e6/6gsK4vVw7I6wu6f/xl5ybrmnOs
	ILrm2BIJexxLxeaN0OXds4lJHRJVjhTFiFpAWz8j3DUNzkD/IVOP6S8vz4RCOTHj3bnEpssAf1t
	nGi+Vq14Z7LWHSGVtz/tCgYmBKGen3FTq+YERQtOnyfJ1e4b7DITLFbeX2TJlsuIs9Vk1niO043
	p3hq/W0t68bAZ6d62QpGGIbNOtcyJw3aJApZZM/YxtAbydYvQONfoYjz/JhjbdGJXed91BuKTlq
	xDRBTcNXmjrOby4UoQws3CRHcXQSxYQYU1o7A
X-Received: by 2002:a05:7300:ea87:b0:36b:d3dd:2e9d with SMTP id
 5a478bee46e88-37255b4c438mr4848268eec.19.1794174943698; Sun, 08 Nov 2026
 13:55:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de> <20261106-tumble-hurt-d1a0be3fddae@spud>
In-Reply-To: <20261106-tumble-hurt-d1a0be3fddae@spud>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Sun, 8 Nov 2026 21:55:07 +0000
X-Gm-Features: AclHuK8qDOv8Crg02YP_zjFhxJU_hbwgG5TwapP7lp6MYqanAg0FpXCbz5Gu6Qk
Message-ID: <CALp3LZ5Vwhx-CqKz7Jr+VE+e0S1EyNO_-OA-uC0h_dz0VF0r_g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: conor@kernel.org
Cc: e@freeshell.de, kernel@esmil.dk, conor.dooley@microchip.com, 
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_135544_618086_4F9FC68D 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

You may have missed my email on Friday at 21:12.

I think E has a point. There is a separate red LED on the board that
shows power. My confusion came from the net that drives this green LED,
which is labelled STS_PWR. This green LED has no silkscreen label and the
schematic is ambiguous on this particular LED.

It is probably better to drop this patch. Apologies again.

Owen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
