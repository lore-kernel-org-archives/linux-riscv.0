Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC395EF0702
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERSdwaBIzd7YPW1Os7j+eXMk4kFzBDyNC6kYmwbHW9g=; b=L1uD45ozg5hz9g
	U0NA1GTxs4rhXkDqQnnEdaoCmCckhj5wVD/oY3w6eO1mgwJqmM0lQC0EKNPbgPaW44afCn5QJ0pZe
	rGvS11Ywoi75MUUKhq7mON3XwPHwUTDp3Z6f1ct0X4P7088vdB7eROElLrjWWfcQ06jxL/shs+J1/
	Vd0+GFSBbqj2EiOyZ1JTNes7LXxJBOUiliIzjwD6LO00J7QoGhyp05dUrUmS0KdNvanuen4sA+dbz
	H/5uNSU4vyeJfFshu18rg1QSrJRgxUUV7lmLOUM3cOsTrxQxoC5r/1pjZm/3DqjL6zngkvs3vebpJ
	Dr9zWPDMEd/FFT9HVHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHoj-0000000ElVY-0FyA;
	Mon, 09 Feb 2026 03:20:05 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHog-0000000ElV8-2QPz
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 03:20:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8871718b05so626946866b.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 19:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770607200; cv=none;
        d=google.com; s=arc-20240605;
        b=hCCGc2oK1IRNBxDeGcZXgbco442aNcYii2dfGF+qJZqKnyQqqH8c4MmAo/B7wLMbL+
         6x1ggnhdqSq6JbWrs9xF3kadxP9Td3tp5qD7HIxWhb3JrEBVJalb7ntJN/4D5J2aNsPN
         a5wqprKz/1mqRpv1a4GU32brFB29BqnBJqAsotr3ZnXYO9yivDi8J7oHn/mKb3aMZchK
         xmVvsISUuqRQCdkXJ+0bvroze2SkHduVxBsp9X5+PQLTA9rIiF2dvjQC1lYHToO9M0af
         0s0lUuG2xjyrKAheAG7htPu2MpzV4oMcSb20Jp8jB0UmRmhzoOGQjS0KygcoKMGM+DJ3
         fq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QTpZ3dQhsPCIcIyPizxNOmCsub1MA47o2XGIfp+wVqw=;
        fh=WqoyS47iFUBCQK3/mwlxl4lopNDZkcmhByj34juiZuk=;
        b=jsnJYtqpeC8XzBWJPxO22ueYia55dkQ79fypyXHJO6nQ6dl65M3/AxX+icbFyC0RA9
         u7TcYq4r70DVb9NRdplI44KPKSfN/GU6Z301pji8s9zaT5k06ZDwhQRsR59ZDGt//Ikz
         k5VEC9IQeV9bRokiGTV74KSI/0vgi+YUYvllwcqbUBMiLXxPhuYOjys0zewzMFg0a7jY
         MjF07IDOJrgGUzu0L+YYg0xUYo3mlU/kPkOcQClk3YAOtdaxENigxpQOcYQXoBPoEH7J
         AG4Bzvjm+Y7GEejPtWPB5B0nGQWZosmVUIFGKyFkJISkQp85N3DNWi2gbyuKAEDQwPar
         PkNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770607200; x=1771212000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTpZ3dQhsPCIcIyPizxNOmCsub1MA47o2XGIfp+wVqw=;
        b=fqTHBlCsqlycxQwh2F5RSVE37mP40FUu7lDxoapPLAwKxfvd4KeIkA7FeKokj6GFsT
         1qP+w+E6qLQ5/60ptaIkieKQIsSwTvbcxIMPRmyx0QCWsWOEQtaxI/rmlrFT6avgViq8
         sNs8C6Ih9jyhqBm+p/aN573C/jUCLPshTVQpjIwrLswckYnxH1VhNAFCUlJ4CECBg3iZ
         ZzvYxwhWYHNC7YFLOoV62RWJYKX2/h2alSwY1pmNOLMX+pcddG9lEMq362pdWk1Tclck
         aZjYSUCmS8a2xRULTz7uBFzNtOsj+ZOyr6gPD6yvoo8fgdNSAlkzKD5mqMRJRRGdT5AJ
         0jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770607200; x=1771212000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTpZ3dQhsPCIcIyPizxNOmCsub1MA47o2XGIfp+wVqw=;
        b=WrEGfsgUd+TsLCvGc7lrw7Xg9LafNpUNRR4IuxMvl1qL0cFLUlHCfmTxqxip3L7Xfm
         sjGySTM25SU3mHbeUIc41uXwWrZna+pNT7enkR89L5KhmY2dJmG3gFJ4KgOCPmjUOfAV
         nKez21IkL+Qj58KbGI0uX0zPnTH2544c9DBjaO0hGtmPlFa59iZU61YvovwOfrLdokFS
         B8TYX1Ym/hTxqhPW6Kx7RmMWfAAGaTw95xhofHBOKLk/AKzndiJR55NiOYfOHzi2WpCE
         9KFkoQn5WKErf9Wwpmtw4O2PKVHMdBd/flenNGI2Ro0QvaGA9r0sojwugSOMVw5Vd9uV
         AnRA==
X-Forwarded-Encrypted: i=1; AJvYcCUt5a/x3UaBIK/m+ZjcJABfZBwmmGlERRQFOV5GorB/3soc8qCMWsTRYSy4MaegZJE5/kMWVIrJWJV04Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQYgOfgcHKkmCY4kII/TQYnQMQRCLnWTYCXGzec9/OmFVW9sQv
	+ssWoss7QbJgLDL/D+BWHAKIXeqeH1JsWcVnsCU7/+SZrDpoCTkPXbADlH6kxNVpkBIX1BvKMqX
	Ky9w9QSPsewEK6JDeEUDxtN/3eo+ZiZibMOsxQIR2Yg==
X-Gm-Gg: AZuq6aIWYEOUFpcfUGE4ytvakxhkTsjm7FG89VEo8BhTP9xzP7S6fn5bnouWaj249CP
	yyuvQV48VOn1+czCDoFAck4XfODuDKwmzBNiIry/dR7ESqfJp8K24HiKF+Kov1qYYEQb0mEI2tn
	RnbSGsa2SfhPxEMY9u+MQB3PKePZs1RNhPnfbyPn+iJppPL/Utt/eDMB+zDkD+ll2jOKA1P5U5b
	dPOZQc+KEG2stsEky1WzOfvqgha4UK6NxcR8bU3xlvkm+CEq0csfpCIgqIFFnV+K7gZxNPFVQ==
X-Received: by 2002:a17:906:d542:b0:b8e:d04e:e4fb with SMTP id
 a640c23a62f3a-b8edf376150mr579729666b.48.1770607199749; Sun, 08 Feb 2026
 19:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20260208063848.3547817-1-zong.li@sifive.com> <D8C71AE40393A6FD+89365591-f896-4609-8b0f-8dffe85b5828@linux.spacemit.com>
In-Reply-To: <D8C71AE40393A6FD+89365591-f896-4609-8b0f-8dffe85b5828@linux.spacemit.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 9 Feb 2026 11:19:48 +0800
X-Gm-Features: AZwV_Qj-9dR3BKTCPrhQdA6_UiWDK2OsF9j8utjRQbwYmgBnYFrxlf2qIsKG7xM
Message-ID: <CANXhq0qmc+vo6uX3ySqqQOPTHxKHJB8t1XC6JuxWs3K5_qoTRg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] RISC-V IOMMU HPM support
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, robh@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com, 
	conor+dt@kernel.org, guoyaxing@bosc.ac.cn, luxu.kernel@bytedance.com, 
	andrew.jones@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, Jingyu Li <joey.li@spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_192002_741785_FBF23736 
X-CRM114-Status: GOOD (  36.23  )
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

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCA5OjQx4oCvQU0gTHYgWmhlbmcgPGx2LnpoZW5nQGxpbnV4
LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4KPiBPbiAyLzgvMjAyNiAyOjM4IFBNLCBab25nIExpIHdy
b3RlOgo+ID4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciB0aGUgUklTQy1WIElP
TU1VIGhhcmR3YXJlIHBlcmZvcm1hbmNlCj4gPiBtb25pdG9yLgo+ID4KPiA+IFRoZSBSSVNDLVYg
SU9NTVUgUE1VIGRyaXZlciBpcyBpbXBsZW1lbnRlZCBhcyBhbiBhdXhpbGlhcnkgZGV2aWNlIGRy
aXZlcgo+ID4gY3JlYXRlZCBieSB0aGUgcGFyZW50IFJJU0MtViBJT01NVSBkcml2ZXIuIFRoZSBj
aGlsZCBkcml2ZXIgY2FuIG9idGFpbgo+ID4gcmVzb3VyY2VzIGFuZCBpbmZvcm1hdGlvbiBmcm9t
IHRoZSBwYXJlbnQgZGV2aWNlLCBzdWNoIGFzIHRoZSBNTUlPIGJhc2UKPiA+IGFkZHJlc3MgYW5k
IElSUSBudW1iZXIuCj4gPgo+ID4gQ3VzdG9tIGV2ZW50IHN1cHBvcnQgaXMgbm90IGluY2x1ZGVk
IGluIHRoaXMgc2VyaWVzIGFuZCB3aWxsIGJlIHN1Ym1pdHRlZAo+ID4gYXMgYSBzZXBhcmF0ZSBz
ZXJpZXMuIFRoZSBpZGVhIGlzIHRoYXQgY3VzdG9tIGV2ZW50cyB3aWxsIGJlIGRlZmluZWQKPiA+
IHRocm91Z2ggdGhlIGRyaXZlciBkYXRhIG9mIHRoZSBhdXhpbGlhcnkgZHJpdmVyLiBXaGVuIHRo
ZSBwYXJlbnQgSU9NTVUKPiA+IGRyaXZlciBjcmVhdGVzIHRoZSBhdXhpbGlhcnkgZGV2aWNlLCBp
dCBzaG91bGQgcGFzcyBhIHZlbmRvci1zcGVjaWZpYwo+ID4gbmFtZSBhcyB0aGUgZGV2aWNlIG5h
bWUgaW4gb3JkZXIgdG8gbWF0Y2ggdGhlIGNvcnJlc3BvbmRpbmcgYXV4aWxpYXJ5Cj4gPiBkZXZp
Y2UgSUQuCj4gPgo+ID4gQWZ0ZXIgbXkgaW5pdGlhbCBSRkMgYW5kIHRoZSB2MSBwYXRjaCBzZXJp
ZXMgd2VyZSBwb3N0ZWQsIHNpbWlsYXIgcGF0Y2gKPiA+IHNlcmllcyBhbHNvIGFwcGVhcmVkIG9u
IHRoZSBtYWlsaW5nIGxpc3QuCj4gPgo+ID4gT25lIHdhcyBmcm9tIFlheGluZyBHdW86Cj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MTUwMjA5MTEuMTMxMy0xLWd1b3lheGlu
Z0Bib3NjLmFjLmNuLwo+ID4KPiA+IGFuZCBhbm90aGVyIGZyb20gTHYgWmhlbmc6Cj4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMzBDN0FEMzUxREI1NTI3NithOGIwM2RhYy1jNWFmLTQw
MzQtODYzMS1hYzFjMzUyYTQ2OWZAbGludXguc3BhY2VtaXQuY29tLwo+Cj4gUGxlYXNlIGRvIG5v
dCBmb3JnZXQgdG8gQ2M6Cj4gSmluZ3l1IExpIDxqb2V5LmxpQHNwYWNlbWl0LmNvbT4KPiBJIG9u
bHkgcHJvdmlkZWQgVDEwMCBzcGVjaWZpYyBzdXBwb3J0IGluIHRoZSBwb3N0ZWQgc2VyaWVzLCBh
bmQgdGhlCj4gbmV3IGFwcHJvYWNoIG9mIHRoZSBIUE0gZHJpdmVyIGluIHRoZSBzYW1lIHNlcmll
cyBpcyBjb21wb3NlZCBieSBoZXIuCgpTb3JyeSBmb3IgbWlzc2luZyBKaW5neXUuIEkgaGF2ZSBs
b29wZWQgaGVyIGluIHRoaXMgdGhyZWFkLgoKPgo+ID4KPiA+IFlheGluZyBoYXMgYWdyZWVkIHRv
IHBhdXNlIGhpcyBzZXJpZXMsIGFzIGRpc2N1c3NlZCBoZXJlOgo+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtaW9tbXUvMmNlOWQ4YmUtMTBiMy00OGRkLWI5OWUtNzM1ODM0N2ZjMTcx
QGJvc2MuYWMuY24vCj4gPgo+ID4gVGhlIG1vdGl2YXRpb24gZm9yIHNlbmRpbmcgdGhpcyB2MiB2
ZXJzaW9uIGlzIG5vdCBvbmx5IHRvIGFkZHJlc3MgdGhlCj4gPiBmZWVkYmFjayBhbmQgc3VnZ2Vz
dGlvbnMgZnJvbSB0aGUgcHJldmlvdXMgcm91bmQsIGJ1dCBhbHNvIHRvIGludHJvZHVjZQo+ID4g
YSBtYWpvciBzdHJ1Y3R1cmFsIGNoYW5nZTogdGhlIFBNVSBkcml2ZXIgaGFzIGJlZW4gbW92ZWQg
dW5kZXIKPiA+IGRyaXZlcnMvcGVyZi8sIHdoaWNoIGhhcyBiZWVuIG1lbnRpb25lZCByZXBlYXRl
ZGx5IGJ5IHNldmVyYWwgcGVvcGxlLgo+ID4gVGhpcyByZXN1bHRzIGluIGEgZGlmZmVyZW50IGRy
aXZlciBzdHJ1Y3R1cmUgY29tcGFyZWQgdG8gbXkgZWFybGllcgo+ID4gdmVyc2lvbiBhbmQgdGhl
IG90aGVyIHR3byBzZXJpZXMsIGFuZCBJJ2QgbGlrZSB0byBnYXRoZXIgZmVlZGJhY2sgYW5kCj4g
PiBzdWdnZXN0aW9ucyBmcm9tIHRoZSBjb21tdW5pdHkgb24gdGhpcyBhcHByb2FjaC4gSWYgdGhl
IGNvbW11bml0eSB3b3VsZAo+ID4gcHJlZmVyIHRvIGdvIHdpdGggTHYgWmhlbmfigJlzIHZlcnNp
b24gaW5zdGVhZCwgSSBhbSBwZXJmZWN0bHkgZmluZSB3aXRoCj4gPiB0aGF0IGFzIHdlbGwuCj4K
PiBXZSdkIGxpa2UgdG8ga25vdyBpZiB0aGVyZSdzIGFueSBjb21tZW50cyByZWxhdGVkIHRvIHB1
dHRpbmcgSU9NTVUgSFBNCj4gZHJpdmVyIGludG8gZHJpdmVycy9wZXJmIGZvbGRlciBhbmQgd2Fu
dCB0byBrbm93IGlmIHRoaXMgaXMgbmVjZXNzYXJ5Lgo+IFdlIGFsc28gaGVzaXRhdGVkIGlmIHJp
c2N2IGlvbW11IGhwbSBzaG91bGQgYmUgcHV0IGludG8gZHJpdmVycy9wZXJmLAo+IGFuZCBhY2Nv
cmRpbmcgdG8gdGhlIGZvbGxvd2luZ3MsIHdlIGZpbmFsbHkgZGVjaWRlZCB0byBrZWVwIGl0IGlu
Cj4gZHJpdmVycy9pb21tdToKPiAxLiBkcml2ZXJzL2lvbW11IGhhcyBhbHJlYWR5IGEgZm9sZGVy
IG1haW50YWluaW5nIGFsbCBJT01NVSBzdHVmZnMuCj4gMi4gZHJpdmVycy9pb21tdSBoYXMgYWxy
ZWFkeSBkZWZpbmVkIEhQTSByZWxhdGVkIHJlZ2lzdGVycy4KPiAzLiBVbmxpa2UgUE1DRyBvZiBT
TU1VIHdoaWNoIGlzIGxvY2F0ZWQgaW4gYSBzZXBhcmF0ZSBuYW1lc3BhY2UsIFJJU0MtVgo+ICAg
ICBJT01NVSBvbmx5IGRlZmluZXMgNSByZWdpc3RlcnMgaW4gdGhlIHNhbWUgYWRkcmVzcyBzcGFj
ZSBhcyBpdHMKPiAgICAgdHJhbnNsYXRpb24gc2NoZW1lcy4KPiA0LiBGb3IgSFBNIHNjaGVtZXMg
dGhhdCBpcyBub3QgYSBzdGFuZGFsb25lIGRldmljZSwgSW50ZWwgaGFzIHB1dCBpdHMKPiAgICAg
cGVyZiBkcml2ZXIgdW5kZXIgZHJpdmVycy9pb21tdS9pbnRlbC9wZXJmbW9uLmMuCj4KCkFzIHlv
dSBtZW50aW9uZWQsIGl04oCZcyBub3Qgc3RyaWN0bHkgcmVxdWlyZWQgdG8gcGxhY2UgdGhlIFBN
VSBkcml2ZXIKdW5kZXIgdGhlIGRyaXZlcnMvcGVyZi8gZGlyZWN0b3J5LiBJIHRoaW5rIGl0IHdv
dWxkIGFsc28gYmUgb2sgZm9yIHVzCnRvIHBsYWNlIHRoZSBQTVUgYXV4aWxpYXJ5IGRyaXZlciB1
bmRlciBkcml2ZXJzL2lvbW11Ly4KClRoZSBrZXkgcG9pbnQgaGVyZSBpcyB0byBtYWtlIHRoZSBJ
T01NVSBQTVUgZHJpdmVyIGFuIGF1eGlsaWFyeSBkZXZpY2UKZHJpdmVyLiBPdXIgaW50ZW50aW9u
IGlzIGZvciB0aGUgSU9NTVUgUE1VIGRyaXZlciB0byBiZWhhdmUgbW9yZSBsaWtlCmFuIGluZGVw
ZW5kZW50IHBsYXRmb3JtIGRyaXZlciwgd2hlcmUgdmVuZG9yLXNwZWNpZmljIG9yCmhhcmR3YXJl
LXNwZWNpZmljIGluZm9ybWF0aW9uIGNhbiBiZSBwcm92aWRlZCB0aHJvdWdoIGRyaXZlciBkYXRh
LgpDdXN0b20gZXZlbnRzIGFyZSBvbmUgZXhhbXBsZSBvZiB0aGlzLiBTaW1pbGFybHksIGlmIGZ1
dHVyZSB2ZXJzaW9ucwpvZiB0aGUgUklTQy1WIElPTU1VIGludHJvZHVjZSBuZXcgaGFyZHdhcmUg
ZmVhdHVyZXMgdGhhdCBuZWVkIHRvIGJlCmRpc3Rpbmd1aXNoZWQgYnkgdGhlIGRyaXZlciwgd2Ug
c2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIHRoZW0gdGhyb3VnaAp0aGVzZSBleGlzdGluZyBpbnRl
cmZhY2VzLgoKT3ZlcmFsbCwgeW91IG1pZ2h0IGNvbnNpZGVyIHRoaXMgYXBwcm9hY2ggYXMgdXNp
bmcgYW4gYXV4aWxpYXJ5IGRyaXZlcgp0byBwcmVwYXJlIGZvciB2ZW5kb3Itc3BlY2lmaWMgZnVu
Y3Rpb25hbGl0eSBhbmQgdG8gYWxsb3cgbW9yZQpmbGV4aWJpbGl0eSBnb2luZyBmb3J3YXJkLiBJ
ZiB5b3UgYWxzbyBhZ3JlZSB0aGF0IHRoaXMgaXMgYSByZWFzb25hYmxlCmFwcHJvYWNoLCBpdCBz
ZWVtcyB0byBtZSB0aGF0IGl0IG1pZ2h0IGJlIGdvb2QgZm9yIHlvdSB0byBhZGQgeW91cgpUMTAw
IHN1cHBvcnQgb24gdG9wIG9mIHRoZSBtZWNoYW5pc20gcHJvdmlkZWQgYnkgdGhpcyBzZXJpZXMs
IGFuZCB0aGVuCmFwcGVuZCB5b3VyIHBhdGNoIGFmdGVyIGl0LgoKPiBDaGVlcnMsCj4gTHYKPgo+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
