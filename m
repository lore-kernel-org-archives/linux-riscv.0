Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452AED5E36C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 14:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3S8XipdsryeW38C5jGslHGTzSQV6dDvzfUARPXEVCSg=; b=wichohi0/E58m6
	lu1p1vS+mqydlRRgoBPFEf8VhfQoupo4VoGk9PyGf3pzLtoGMIDTKqtg6SUTb2zJPPfT+LeJpzypS
	MVQbJlm9EdvB8bQQVaXPbPDG3fGImNKgSKNtahMsvAAuePL6LZtaZmKfTaNXSWS3ieZS+YE269j+E
	0xbSm6kgUl/MpDxKV1iD2Xa6FwOA225AsY3VNcfWT7oY/+UFuwCv2DbQRKngR/TNsMZY1tcKhmNjB
	JR6ILtS0oOAOJUjntKeiMhbl/gqZ5Xj4+887ggJGFscImfGPJRGpHN08fPUI/sxDMSyTu99UCCh5d
	OUQpwDgdhos0AyrGiKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVj5-00000005JwZ-3kiW;
	Tue, 16 Dec 2025 14:08:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVj2-00000005Jvs-0oSc
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 14:08:30 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E48A73FCC7
	for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765894096;
	bh=s6OKug5US6pxBUrhttaNzk4ojcTJP4aLJKCdbICH8xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=PvLG96qDo+woYX5n1DgnOprhUAZJkkzoBEo3vcnuIcMfMsvvDSG5LOJn0cGeL5T8n
	 BsjfUQNRRbPwfit36ExJo8eOWfrykWt1WKlCwnF4v2B6otuaCAcbzYp8cGJshCdSdQ
	 0RUqgyiZnLYaqfvVUo8OpJYxgNlW3kTsrADzGSotDCvfvNzxl0YSBCLxQi/T9BROI0
	 QHz4dYI6djG+FGL29e0/iUq6eIP9LYa3Atf3U4ioE8nQrGUKvQ6YHjTBvKkP2vpcL1
	 1D4p1Km+zZs5wjAr1QG2eTZknrBRlkGw6kshw6SoeypCkFW0j0q8DfYDWUIQQEhzZO
	 IzLDaL0uko4J1e4NC3daGXGbAxgXYm5lBgKIMMuUscpHkwX7nsIwRKH9tau4ym6pfW
	 38ZSf1BRxhi7rUzzz3fOCchwDKwr4uNqZ6luOpxLlwFoIjKWelgvhhW55LpVnmyRcB
	 UMR0N1ymMMSsiiBAPy1EHxh5LqKpAjIzVsJ4jPD9iVNEfNgIUyn4fSrHIh7Vid/P+I
	 RfecI/k8b2+1rDmyXUJI8D9hZ7LOjAjjgEcu9rb1nnoNCR9dCpxU83g03JO7k3eR8U
	 HNy6l7yUyrWfdoiRASlONrldmSarzJd/rvU12cvE1K/fmxh/Ezu9K8FmiuSamJ7B5A
	 Flsja4grLDZnO7unLfMWrCEk=
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-64981bd02a4so7403849a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 06:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894085; x=1766498885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6OKug5US6pxBUrhttaNzk4ojcTJP4aLJKCdbICH8xs=;
        b=DbhsyrGnsKk/M0u6uuuNeMjCDREwxRhgaVtXk2z5BnpAjyfND17c3bBXac1Nlqq/Gc
         ZmlJ/ZgAOw71XxZYVKGxIZpnFw9e0ZwfIY/AP7MSoCmbP3oPw+uug5ZTPj3L67aKUJor
         tmG2DZE4HewWAjBTV7AwYWKOfFUfdJ0hjQ8nGpZkKReCTiB4sSBFycarFxMVAf/viSvs
         gi5Zg/X2ir1yjOZrEZk5WG9vC+mTPyzH0I62Vh4hsYlmM+QBYHgXswyLQeU2ReZRZIiQ
         jv1oQJASIZ5j30FREXb6Ikp6SbZsRRORRLtvAGKCBzI8Nr281blzcPwmWb5wN6/my0e+
         9LVw==
X-Forwarded-Encrypted: i=1; AJvYcCWOEQyaf/w0dpSQta9wxHZTKBBgyo4opUqFLHaKCNM4tZjkmS15m7GpGqB1tv+HP+aX61lE4mKjUpdnzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI6cirXvOySZE6X/pZrT/njqyNjsodZcVQXtA58wjJuRH8T+dO
	uNlA9VngxuJr5bswz8jp11ncCce2eMLMrs6JpCmmGqeF6HjdNTrWheTeRzU8wt8kJDOxIVAEq5Z
	48RZWsIsA3ZIIK4TveomxQBnDd3mlOlVlAwZWhGw/N3FAxwSfw6XuSNF0E0DNqUIL0Trdl6aZQH
	kOSj0J2X8DXA==
X-Gm-Gg: AY/fxX5q3yVqCny0ppcdex9XgfBRUeCnphx1XvF5j2SGRY+G7tpo9HDzPxdZZrNsRpN
	Dvl8hUKKjiJmuMybW6cVT8FCfFUDHichN6YpVdqRL7aPAzKG3yRBZJX1ClOsE0zABTZvYyeGQzQ
	Z6+xYjN+2l3Ff+Sn9GbQbPQgq4hnglZsyHAXRGYGIJmWOl00HX/bqh2jzprrMxQ5UE7lZqYo5Gu
	syh4iwsBFYxT/VyVRGRu5j/I+spjUK5qFty39pYS/NUkkZuCjOpJ7Gl+Kw4fGxJxN7ihEyOLc32
	gEhkT2A0Q6RPNCitfU3VTVib25YbT9skWGYrgJ8KjsiGt+ZSN2VQAsSSN9fSWQq9gP+/9gHNFLN
	54T5LTDill1VZLQ7eK9LYWwGlD0yQODmEFFIEKp+8rYyGHt1UDR4Nyb8ElAVhCW+OE7ka7LS2fm
	UM1qSIUniRb2FzMQ==
X-Received: by 2002:a17:907:60cf:b0:b7c:f82e:30b with SMTP id a640c23a62f3a-b7d23b1c3ffmr1594364366b.52.1765894084886;
        Tue, 16 Dec 2025 06:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtqWjNEWPbxkffOmFNn2OFkrwSQdkzVjA6Bq6rV9Lw/Z0LSQ+mn+A/wq7Eqay9PrsgCg2JGw==
X-Received: by 2002:a17:907:60cf:b0:b7c:f82e:30b with SMTP id a640c23a62f3a-b7d23b1c3ffmr1594361066b.52.1765894084492;
        Tue, 16 Dec 2025 06:08:04 -0800 (PST)
Received: from [192.168.103.125] (dynamic-046-114-006-010.46.114.pool.telefonica.de. [46.114.6.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51b859sm1698504466b.43.2025.12.16.06.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:08:03 -0800 (PST)
Message-ID: <e1383a10-84ac-483c-aca4-7f2b39ccac16@canonical.com>
Date: Tue, 16 Dec 2025 15:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_060828_518042_AC0D4D08 
X-CRM114-Status: GOOD (  12.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/16/25 14:32, Guodong Xu wrote:
> Add compatible string for the SpacemiT X100 (RVA23 compliant) core.
> 
> Link: https://www.spacemit.com/en/spacemit-x100-core/
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

LGTM

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d733c0bd534fb63ed7c0eada97c42832431f1fc1..cce87092dc7749f49066154d9a256af6c7b6c19f 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -62,6 +62,7 @@ properties:
>                 - sifive,u74
>                 - sifive,u74-mc
>                 - spacemit,x60
> +              - spacemit,x100
>                 - thead,c906
>                 - thead,c908
>                 - thead,c910
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
