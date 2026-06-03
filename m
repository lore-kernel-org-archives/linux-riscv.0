Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1272CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1aKrtcikg8Pga2GE3HnPUtgS9FaZUspEpQyioC7yMw=; b=UFUhnUAg77jIJu
	7JjWwhuZECmXnPXsdnEktQWGijuwy2s+OB+fnLWQImWqRtAeQ4tRTtwDDp5pMX1V3UU8Qw05oiKt1
	e6pf1tA0x1vDpWYoAGumXqYemL5Gleh3mJcvr1fGt31pIL2fwkMSQa+8cwQyeBGdbCf8uxCK8RaHA
	918Db0o0ctL7licwy3Mm0T3WKI0O4m/rXODePmhSnm2gxoaCgKGxTRM29l65jp3l7P/M4f3dDrEAJ
	qBJdd8XBpwqm9IIN95vIlKtyVADJU3qDHR/OV7G+cKAmL4wK5l/wBhmmYy3D5vXn1qVu9KDtLIAGJ
	Pw36Xsz0A5QZJZDMVfyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgNA-0000000EWKT-3hub;
	Wed, 03 Jun 2026 07:50:44 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgN8-0000000EWK7-0FtJ
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:50:43 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-69e2c792289so1800930eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780473041; cv=none;
        d=google.com; s=arc-20240605;
        b=bFwU5xmx1a2xjVgOBi6B68kiNxJS4jdl9NhI6GpL4+/tNTasr0kjK+xikL8A77ta8o
         6B/a5h1EuwhNpF3BTUB3L11c0Y1+F9pEDipxblfG7/9byqqpkPIi2PExR07chmKInlgs
         R8cuVKRy7mHfx58dEblcZLuh4eoF72sjtOrJ9pm6OEpZau4Rk09FuMJPGZBQ520w3x3x
         Tq6C/G7kLc+p1+0bUmp5wEpfhPK8nm3a/nOkGGPDO80/K1LjUBsgPX1UDvUp/zyc9h26
         uPwZoBQSxSAOv8NDxaCM8yND64gP9BuxXnCuGDl/xPltmBVFVvZgHr8DzDMJTfvd8Lmq
         Kkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xYHxFGfinYri+us9/Q/zWs+R/40L6rjvaeGXffPnQj4=;
        fh=GquNiEphYp6o+dSlNpRHh39JVj65pfRGHq4iv9Pu3Vs=;
        b=PqDb+E5+0BTmK0oiwFjMquzai54xFJDF6oDxGer4Sj2h67Q7QLex2++EHDUYIveAn0
         blj6rciEra2KKac/1Sc2smIFotcBdzN4sxdrb4Sys3zODawi1n6mRPUylYO/WhkdUsTd
         EokXS8+/AXAPy44nApKq9BEzkb7NlBgXlOWrjhmKmJlMBQooWHcbyX5ebx9YjnEK8u56
         +RbPTwkv/qH/PH2lgws8eMfivGKstZp+kjrSkplrrxPMlOvkxmRnMH8Wcxz40wRlBa4D
         6/hgg3XsHgcRaujrqKZSs2bEQYLVQTb1/Aj9sNMm/rSDHFhvmQ1N2WbpiR1kIM5pyJG9
         ZrzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780473041; x=1781077841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYHxFGfinYri+us9/Q/zWs+R/40L6rjvaeGXffPnQj4=;
        b=sdzo/Pyrc68WXOByDA9MJSBqvzpNnm25sAx2xVTkEx8LVjLwQLe1aN4gSIltTwhqrj
         crzhZHxDx7eMMK+jkWDF912BH+WdgQryQL0aX0ibViZAjU0flkdik52orDXwDafdiitf
         Rh9m/VaA2VKjBQZZ3K7RXEpB7epZOY8zRFznk/v/GFUYeNGLDOykrmIuoRIrhGlWWhTl
         /Eg+dUE+Np3TytdZzRE9vO+RIXgCPGXF9Kwki+YPv8rWc6Lk2qDlkxvPyk8gnHeVQztA
         lA39hflDzf7cYb3kDwzWX4Iez7JsCU0gOpvJaVt3fm1886DQSxvSvfnhGC+61XIdonNg
         BoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473041; x=1781077841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYHxFGfinYri+us9/Q/zWs+R/40L6rjvaeGXffPnQj4=;
        b=HV8kI2t1V3HzlJ65/wvbQerOh9tFQg7svws4QkV6TxQo2pw87qU1xpDds3YMnqp2le
         wO8lXsOYN6VFpZgd8uQ7dtK57+boDcVvXEGIHrBhaqGMlQAF5OK1AF8cyko+NyH2P3Qu
         xnyOLfwUxM4L1C2NL9x8SDfJRvsyBORcA8llSJrzNlWTCJs8BqjgUexDB6rvnasB9k7y
         e4kaNf5quHt/qA3iuYeCNcZobYCsMsaETbsYw1KjoA+yvpF2hv1nSbvcb18xV7cGSmzs
         WtZAGgcephKlt9/lne0EdTjMfVbtdQvZq2WK3/2fJImtcRDEi1CCsyK4Dft/+CwSl5HM
         Pj8A==
X-Forwarded-Encrypted: i=1; AFNElJ+i8HWBwTD0hF9bybaAZ6/7nJRGCm+GSS520yKwA2sgLQ6eQv1cJpUsEA1RlvRtoe4Wpk0WJkX4++/YIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWFvDtn4uzqb0hYOaq8LQSSbYjCCGfzxR4YD0EmfKjx6gLTpHo
	zAcrPNR4IStlNKuLvqcdoy6Ug3Efqev7FwoeUDUqmfiR+nYXbB4LFIUBmdGlJguntm5R9/RRjQK
	jAxHBEJKfnf4jrj7Ucx+MryVvjMlCK8kuxceRjZbmuA==
X-Gm-Gg: Acq92OH9q4jcfTjvJvOkzWOf5WE2TDCoi+eSz/fGcTMhl0cTR4g15MjIivO1XSeRRY4
	fU8ahe5aaiM4gNFmQ5t+2FdWO8f1Qf2O0OaIB4iFnG/AveSmPo4D0DklHyTLh918hT3zifNjwRO
	+Eu5A/uyshbDyV4Py/qY32hshHi6CDYYEWyMRNXkFeYJmarjUIXfq/9ukFp5JxFukt7HXbLTieA
	BEnj+JDuEjXSefVp4julAKvsfq8HzmZmVpKVduurqbflkcjB6jnaJjW+9r6l3Jtdv03iKGWJxKy
	fCFxU30ZAweP9K4ifNVTw+UOS/8NdItfu+oTVPZwvuOyOCkRK6SiYvYHlc0wUIPDZTRQvDFeROG
	iMOzOVxogpa7KdKRWzd2Nvvhk8/MRX1e3DpMYqg==
X-Received: by 2002:a05:6820:4b82:b0:69e:ab0:3f4e with SMTP id
 006d021491bc7-69e4809bc67mr1386463eaf.46.1780473040894; Wed, 03 Jun 2026
 00:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260603074222.593243-1-joel@jms.id.au> <20260603074222.593243-5-joel@jms.id.au>
In-Reply-To: <20260603074222.593243-5-joel@jms.id.au>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:20:29 +0530
X-Gm-Features: AVHnY4JSlAbr9dlQG-_M5xhgpMiEqTpdhzx2cxP5YYAVKefozEsh5CDxsKMym-U
Message-ID: <CAAhSdy3cDWy3yNSx=exEk3hjSWYrt2Uye7-eK6Yq9qHOrk0Xyg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_005042_107823_C1D9689D 
X-CRM114-Status: GOOD (  17.83  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxOjEz4oCvUE0gSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT4gd3JvdGU6Cj4KPiBEb2N1bWVudCB0aGUgYmluZGluZ3MgZm9yIHRoZSBSSVNDLVYgQUNM
SU5ULgo+Cj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+
Cj4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiAtLS0KPiAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAu
Li4vYmluZGluZ3MvdGltZXIvcmlzY3YsYWNsaW50LW10aW1lci55YW1sICAgfCA1MiArKysrKysr
KysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3Jp
c2N2LGFjbGludC1tdGltZXIueWFtbAo+Cj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJ
TlRBSU5FUlMKPiBpbmRleCAyZmIxYzc1YWZkMTYuLjQzZGQ5ODczYmJjNSAxMDA2NDQKPiAtLS0g
YS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTIzMDA1LDYgKzIzMDA1LDcg
QEAgTTogICAgICBKb2VsIFN0YW5sZXkgPGptc0Bvc3MudGVuc3RvcnJlbnQuY29tPgo+ICBMOiAg
ICAgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ICBTOiAgICAgTWFpbnRhaW5lZAo+
ICBUOiAgICAgZ2l0IGh0dHBzOi8vZ2l0aHViLmNvbS90ZW5zdG9ycmVudC9saW51eC5naXQKPiAr
RjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yaXNjdixhY2xp
bnQtbXRpbWVyLnlhbWwKPiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jbG9jay90ZW5zdG9ycmVudCxhdGxhbnRpcy1wcmNtLXJjcHUueWFtbAo+ICBGOiAgICAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RlbnN0b3JyZW50LnlhbWwKPiAg
RjogICAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJlbnQvCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yaXNjdixhY2xpbnQtbXRpbWVy
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmlzY3YsYWNs
aW50LW10aW1lci55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjE5MmZmM2ZjZjc5Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmlzY3YsYWNsaW50LW10aW1lci55YW1sCj4gQEAgLTAs
MCArMSw1MiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL3RpbWVyL3Jpc2N2LGFjbGludC1tdGltZXIueWFtbCMKPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0
aXRsZTogUklTQy1WIEFkdmFuY2VkIENvcmUgTG9jYWwgSW50ZXJydXB0b3IgKEFDTElOVCkKPiAr
Cj4gK21haW50YWluZXJzOgo+ICsgIC0gSm9lbCBTdGFubGV5IDxqbXNAb3NzLnRlbnN0b3JyZW50
LmNvbT4KPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFRoaXMgUklTQy1WIEFDTElOVCBzcGVjaWZp
Y2F0aW9uIGRlZmluZXMgYSBzZXQgb2YgbWVtb3J5IG1hcHBlZCBkZXZpY2VzIHdoaWNoCj4gKyAg
cHJvdmlkZSBpbnRlci1wcm9jZXNzb3IgaW50ZXJydXB0cyAoSVBJKSBhbmQgdGltZXIgZnVuY3Rp
b25hbGl0aWVzIGZvciBlYWNoCj4gKyAgSEFSVCBvbiBhIG11bHRpLUhBUlQgUklTQy1WIHBsYXRm
b3JtLiBUaGUgc3BlY2lmaWNhdGlvbiBjYW4gYmUgZm91bmQgYXQKPiArICBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3ZhcmNoaXZlL3Jpc2N2LWFjbGludC8KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAg
Y29tcGF0aWJsZToKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAt
IHRlbnN0b3JyZW50LGF0bGFudGlzLWFjbGludAoKVXNlICJ0ZW5zdG9ycmVudCxhdGxhbnRpcy1h
Y2xpbnQtbXRpbWVyIiBhcyBjb21wYXRpYmxlIHN0cmluZwp0byBiZSBjb25zaXN0ZW50LgoKPiAr
ICAgICAgICAgIC0gcWVtdSxhY2xpbnQtbXRpbWVyCj4gKyAgICAgIC0gY29uc3Q6IHJpc2N2LGFj
bGludC1tdGltZXIKPiArCj4gKyAgcmVnOgo+ICsgICAgbWluSXRlbXM6IDEKPiArICAgIG1heEl0
ZW1zOiA0MDk1Cj4gKwo+ICsgIGludGVycnVwdHMtZXh0ZW5kZWQ6Cj4gKyAgICBtaW5JdGVtczog
MQo+ICsgICAgbWF4SXRlbXM6IDQwOTUKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJs
ZQo+ICsgIC0gcmVnCj4gKwo+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtl
eGFtcGxlczoKPiArICAtIHwKPiArICAgIC8vIEV4YW1wbGUgMQo+ICsKPiArICAgIHRpbWVyQGFj
MDAwMDAwIHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJ0ZW5zdG9ycmVudCxhdGxhbnRpcy1hY2xp
bnQiLCAicmlzY3YsYWNsaW50LW10aW1lciI7Cj4gKyAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQg
PSA8JmNwdTFpbnRjIDc+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcHUyaW50
YyA3PiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1M2ludGMgNz4sCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTRpbnRjIDc+Owo+ICsgICAgICByZWcgPSA8
MHhhYzAwMDAwMCAweDAwMDEwMDAwPjsKPiArICAgIH07Cj4gKy4uLgo+IC0tCj4gMi40Ny4zCj4K
ClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
