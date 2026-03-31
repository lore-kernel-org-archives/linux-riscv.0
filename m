Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0B1FF60FF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFCTvecB1o80KfeADD6ZsOTfwwG2Cm03eCs5v+SecYw=; b=Jrq6DsBbdT8gQt
	kv4tD8GUNkPBv2jGcoR3Dmdh/uHyk+I84N5d00dk82JII6CZuEHlSsi1lBWKevgZumfG1mOUKttXn
	BGV9FYg7mi63VTQKD469KxP0gncjIXlrH0BEAX7sonYQfXpBKC2jOlKD8AOB2UtNZQ+E1lIOmKk4h
	tS4jl7g1GLilQgl7t1CgT98SbdccjXkvo0bi5+3EQ48dexIyHbazewND1JEuvC7YlEsYZ/qvicAWE
	2ZI/QCJ2ITRm1bSmzxXLH4ybxTrNfmBWOkzKGEq3PaOeKHm0anfwIfNoA7k3c8hJh6en1VjpKjMAx
	53D59f0QxHSFuEjs4fHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WoW-0000000CorT-0ei4;
	Tue, 31 Mar 2026 10:59:16 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WoT-0000000Coqp-0h8T
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 10:59:14 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so6875846e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 03:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774954751; cv=none;
        d=google.com; s=arc-20240605;
        b=dXQ8xto4UMWlIVbS7m0puNj5ClWyxQSv2G1My/54nhYTcMFhIkyvFcPvp3ekCeWC73
         IP1blSDTHEan5nwU0YfaeF3QffaRqpvQN0d69ygknH6VA13fCKxU542/JYtrfWYOhde6
         QwX7TtVmw7HJY0HhLK6yKAkEm9rR89CFKqaHYA6drEMGdC+ZrOaqVElfvziPqZ1vWzO1
         4Ix6Za0vDkC/YxVZZ1rzGqpH43r/KzcGes9IiWmMsUdAv9+vu6zSIQnqNhgQ8bNvcdB/
         +c5QA+ZB5WWBFc4NS7/7za9Glw+HWNRR9g0TmQwUw7XZoGgMAmTDQLW7lnEWitXIfpPQ
         NPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        fh=Wuz63Ya1MGRQHCcwxqg34TUbn5nRxcyKQxJh60X2MrM=;
        b=eBWx4G3thQWikfuxwzpcDn6MKNVb/T5d/2Vp2n3PwG7W4lyf+i6vUkDrwKuHAEHCHz
         iR02ZOr7jwpSdpnIcjwi8h6EJNRcB1rJU1D7QPcASHHvZk8tQpywIbVsGmqODAAC6IlL
         3SaitvyWVLIoLeUXIGXjNkxC4XpBxmUsTvaxAXYR1/EJVdcmHJ2ou6bwqCyo4YElczvr
         hEs03yUPFhybJQd6ucBCc/1iBuKnQTpbcBO6Y0jozOPJGR7VQIC7ckoQ8zpMbGFAhuVY
         dp91NRIdKYGG5/jS270M4+gsulhbFkQ344fOZtIdaclgy1/7S+6QLf9GFsw19JP6Rfg0
         KhEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774954751; x=1775559551; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        b=i7FYx3yTwCO/WwIN4hCzpzAN8ILuw/SQ0TtvQ85XCJ0ndEjLqwE7Y5CJOawz/6rS8F
         24abSrcSbe8jdllOwin1AZpNgEY6zrjqzrXk6w7FukBTdSlQAN1WUa9QKIMWtn8zwzTI
         XYDdwLvdQdGPkqL0e5hMWEjPtsV8FUVkAmWj/dgIvZJyH9oim/G8/vRV1fAnuS8lZPBK
         YTQfkr3lQGPAPANia+4nq0pg3F/qlouRwcrB+HaVufBbRzpQ43Eqv/DhMMr43IipIhhF
         uurdXBN/HEXQ3Dj8U0eciVlFgD1Evaq/ycZ0LxqAVclElfT/wV4asFBj/6B54kBV15pa
         85vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954751; x=1775559551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL8mGMhRS7HqUOu1W0Z30JuQwLChCz1UuGa8bh9Su6c=;
        b=NZJA2NtAFcujb+GzQuAmbjhpIl+4Gg9/fgB6OtmBV0CVPDxagLxo4XDrdx42bfYgGG
         Ucyhy3sLf/bHqrVlCrC9J6DdzWDkPJpMrXXPdE8e6e1jkrABviqG0Mru7y72n2GRBvLb
         OtID/0AbuXblaWCr7A1V1WXfo6xhQcxDX4hYu4mSpycw+MkQDg1CqYCu74WthmrhQP7p
         NYm66UiAxubzRvD27C5MKMkR5xlVfkSDlS49AOf0i98kSH8gc4e2tnwYkehG7WsUnVMc
         uf8eN3mNM9zadEKoHg3wMv0GrH1/T2ybPjKA2oauNc4Q+MkURkYf7HkCQn5K6nAW5hI9
         QtUg==
X-Forwarded-Encrypted: i=1; AJvYcCWpHCtgoLFS4eevcaQj277UVpkCE4UMeGdheCFCTCy1Mt9JsJqgN4xPSooWbZAD2ptcfva9lMzsnImDXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxznN3Ys41ZpwJszEs0Mti089S+Vsry/NFfZJIlC6HRjZxruFZL
	r8Tx2QIUCKDeWHw7Pv/4vmxeIulsYq1wIoAV5dXeuF60kq3aQ0g7jvo75zRDGkXB/wwXu8/+lku
	UqKKuUz5C2kLl53+qCIhrwbNy8C8l6+bh29O02w1aPg==
X-Gm-Gg: ATEYQzxEMHIczwfT8yYUN6ajdNXFPBmxeB0qppWoa97VM2t5BRg5nIRn2z+ScI4+Vqk
	UVfUhtErqUBvIJ01WmHqhRCWlkQwI+sG/ihSt5i3KzAbEjvizjDox3hoxL0Df3d3ptLMXidYCoy
	+QhRi6cewwsVI8pW08hEJM4YL1hUroR7SIDMlOjirOqvBTyhJkeuvntQVexepeay0OeWkfIqtwf
	pVu6QPoOqpBSlLoWuH8q60gZAM6bdDIF+Xb4SsEhLLQjh8eI3EZgMuZPNsaVXVYe4Ovd5f7pT33
	21Euehg4
X-Received: by 2002:a05:6512:3482:b0:5a2:b01e:5b5a with SMTP id
 2adb3069b0e04-5a2b01e5c9amr2976958e87.33.1774954750886; Tue, 31 Mar 2026
 03:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com> <20260331-eager-kind-civet-62f60a@quoll>
In-Reply-To: <20260331-eager-kind-civet-62f60a@quoll>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 12:58:33 +0200
X-Gm-Features: AQROBzB11zXXvkr31NXEyNIIlW6o7ZaxcYR8a2pmCHpw6-PFnrMqVgTaVeOSgY4
Message-ID: <CAPDyKFrafqhNbetL5kOzAFO526yUrJWa6mS_FPX-cw9bj2Mg4Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_035913_225829_8A02CC7A 
X-CRM114-Status: GOOD (  17.21  )
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

On Tue, 31 Mar 2026 at 08:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Mar 30, 2026 at 10:38:02AM +0200, Iker Pedrosa wrote:
> > Document pinctrl properties to support voltage-dependent pin
> > configuration switching for UHS-I SD card modes.
> >
> > Add optional pinctrl-names property with two states:
> > - "default": For 3.3V operation with standard drive strength
> > - "state_uhs": For 1.8V operation with optimized drive strength
> >
> > These pinctrl states allow the SDHCI driver to coordinate voltage
> > switching with pin configuration changes, ensuring proper signal
> > integrity during UHS-I mode transitions.
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/spacemit,sdhci.yaml         | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..201ab97f0e88376a4680dcca7917e8b3172bd84a 100644
> > --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > @@ -44,6 +44,20 @@ properties:
> >        - const: axi
> >        - const: sdh
> >
> > +  pinctrl-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      enum:
>
> No, that's not enum but list. Look here:
>
> > +        - default
> > +        - state_uhs
>
> Instead: uhs

While I agree that "uhs" would be better, we have tried to stick with
"state_uhs" for legacy and consistency reasons with other mmc
controllers.

No strong opinion though, what do you think?

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
