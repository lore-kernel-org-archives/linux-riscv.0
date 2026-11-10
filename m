Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464BF606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H3tQhgRr;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=G61AiFNR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BpKMPkZ2NjCw9vHc4AJJtFW6T+USAI6HC/OMKh8ix0k=; b=H3tQhgRrU7/8TOSxbM5h68u9Sj
	7ZHF0E2fGix36ivpyDg+kzX4jCErbx0nL+ZeFyU2IKhFpLRA45Fg6o8g0y3EJC3dl1LogyUETvCxy
	N2txKD397cwsP0SsLF3nxXBQgvtahZQT+kTTA2LbbL/e3yIBEc8oPxfUEZa/NToL1BTTLSwb0JX9I
	QrCeFh3D0ienPlGk9G8qR9zJ9MZvxxYZCmlrIxpnHa+g5r8sRxkY6DFL7VYe0QkklURBUR7/+QJN6
	S/7Cx9dNrX1AevWc1Sf5g4SEj0bNw6nIIDcDOANIueYHI6RXVnMmDI3NZwP3itty9wLcQ90yYj27P
	Im2AZkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlFG-00000003uTR-05hr;
	Tue, 10 Nov 2026 12:46:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlFD-00000003uSe-00q5
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:46:37 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6DE73FE82
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794314790;
	bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=G61AiFNR7+hX2bDEAbsFPkrpgXB46tJFAHNMp4OSEEeQ4Aso5eFzv9/Br1GY/93yI
	 q93Ia4ktphLOYDxF7qKGBS5NzwW4pPAGur9JoHPldgRK0J/cSgqcYpM9gIBHhZ69Ef
	 sdMLVQlpzpJmY4ntC1MwAZhndjkW1nycjohaYLHJ+9msvZ/qTCo/Z7Mp4YfHhyTW2c
	 4DyWIte/iLpENEbMzAe4EnnxBCU+9GhEEPAWcZ5exXZo0KFgpbdCZo2BV5TWKYNjh0
	 eq/k4AX38H/xDmb0n7/oagTUB3x/bq2H1TEum/zdBzEfKMoAACAdT/lFpNcyqFqS7P
	 V1f6sJoAZDz8zTVb8k2yGziqaAaYSLrqLXawVxRW/Q8PvaGTXBnE0TMFupRcJez6xK
	 BWA38liQhxO2m7EUiE4LCsuuoaygMth9vuBQ9Xw2sChbtYY3Ja8jmW0Dpgby76PXqB
	 TVnraGuqKxOAFmCfwBF++ftc+YPtcBjUZQ4fILSFAHR2WxRrp6bTPCfbo+J7pmI1rO
	 ZJ0QTP6J1K4Tknq64zgYP85i1XTMitQ2zP+lnShOLbnWLzeJsy6GHWjj6L6XJnHdtm
	 ToinWv80iqrACYXiCOCJTjaHKp3CWEUk64mlLH3NLsYfVG9mnyiLgE8N3KoJYnOQzg
	 7Of9yZvB6CE/oyj9lzzyapGU=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1213816f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:46:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314790; x=1794919590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
        b=nANcaraMwkBFbXUgTzBVIRUQRspQ6fC7cDF6Ed8oSsZfIlX5AH53d3213sQuUMxL9N
         JzX6ZfPM7iAlFlIC6rRRcoB41f5i0oUPOqv4xuoZ5LyrjbQwYa0wWqepAm1YTlw47i/Y
         xH5v+39BwLJlrHnDaRafFN8TUlNWbvnr1IFYnXi33dGECzZHeqgHq+8YvD09rJ6RlX16
         KKRTeOaR9GKDfSfKmy4oarRL9LUMrCUeH7ssz8vukzvlu1m0indH4QGQUlKlAKryKlVm
         mD6grFPfhokGC02gtXHSYuqzPer5iMG/zg24aLkyWOLkQ0NNV1zHwe/KDUiSzO9wH1iP
         zT7Q==
X-Forwarded-Encrypted: i=1; AL+hErHLXZs4MlTbTEUqF/kblUq7UD2+CxRLk2e/dwAiyyfRlTifdzWO7uDKEOWm5zMoVOorrHvY/6+KDoi4Gg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9JWSDetgnqaKNVmJHH5vHz+RDt4AHR71pQCyrDhiMva0j3dMHk
	obQYmCWvyDey9pV+xvL7a8NRdM9r38aGyWyjTcuP3neC29ijJC12pvcAiFSb/ESYZD1CLjU21+A
	GQgfTZxIB4px7YPgZMHQvZGJ7mzVt/aSwVKmv9AEMZErQNZY3UcvqBETCT/dqkIQzaqFEVAdXG4
	jhZboxyAZsPQ==
X-Gm-Gg: AYBFou0d1csLZFfVz1o3vg0b40jg/xn8rEiU0Ts/fdCskmTkjWYjmoMAK2n4NDkqdkz
	TBFBoliIZiDwxu6H0MhJtiHsYU6GwyD9REJyjsyxd5uEi9Y1MKFdG2IQdE8d5QBsluEQG3YjXBf
	TpvuivppoC+GELWAl9CLwaEYcrLj5EC97Cin2TZByL8B+wMFViKidMLJmaVcMzVwNJfbUUgIAp1
	eTf6j98WwJs3uv5JHPZavNhjVfXFNDAyfJaauhfcL/VDjy+aYtif2J7vBt5WjQ92ErueQXpiJ5r
	NsWvRrEhLc+IhQiUWuy1YsO/liSIadFR3pC2B58m3VveJbqIi2QlSOxEcLPpuZmYQ1wOUuE5ezC
	nx0mJ0O8k0GBOzHbGMGDOJLu9KRZgGGwZ/Rl3osJ0dDBVqIxV5yQiMrLxYGevF22V+u5eInTPOD
	lzsw==
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310515e9.8.1794314790552;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310155e9.8.1794314790230;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm71022925e9.9.2026.11.10.04.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:46:29 -0800 (PST)
Message-ID: <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
Date: Tue, 10 Nov 2026 13:46:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_044635_452810_07A6C790 
X-CRM114-Status: GOOD (  11.98  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On 05/11/2026 09:29, Troy Mitchell wrote:
> +	model = "SpacemiT K3 CoM260 IFX TQ";
> +	compatible = "spacemit,k3-com260-ifx-tq", "spacemit,k3-com260", "spacemit,k3";
> +

On the CSB1-N10SPK3 server from Firefly, using 10 K3 nodes, reading the 
TLV EEPROM of a node gives: "TLV 0x21 (Product Name): k3_com260_tq".

The latest EDK2 from SpacemiT derives the compatible from the TLV EEPROM 
name, so EDK2 will report "spacemit, k3-com260-tq" as compatible. This 
is by reading the EEPROM that was factory-flashed, so it is not 
something easily fixed by a firmware update.

My understanding is that the nodes from CSB1-N10SPK3, the "K3 CoM260 TQ" 
and the "K3 CoM260 IFX TQ" are all the same: a "K3 CoM260" module on a 
"TQ" or "IFX TQ" carrier board.

Is there two different carrier boards name "TQ" and "IFX TQ"? Or is it 
just the same thing, called differently in this patch and in the EEPROM?

I've seen EDK2 referencing both configurations ("TQ" and "IFX TQ").

I'm not sure how devices out there are referencing themselves. But if it 
is in fact one device and the EEPROM calls it "k3-com260-tq", this patch 
will not work for device-tree matching.

What do you think? Can you clarify the situation?

Many thanks,

Sarah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
