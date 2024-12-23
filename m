Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694AFE7718D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrsF3cFPmq7+4q0PLD43YY5ZOYuAcC/eEFo97eZVjds=; b=rd4y5GY8/DUvEv
	PV8BobWtVIu7Yr2qDw3mcsSHD3QWjrCGSDWLeiA+Q1lTZc333y2mIWV0K6IzRmP8D7jZuy9R5k1wL
	Eqqe2s2bZVWEsjWSGXnzMf6MyWNVWq72abeAFHH5gTNBEV5lcWkAooI0YKoEb1WYPIiGyIshnTzWb
	LE3G9Xas5IAZKoQUTQny48gphAa+EM+DkJZlm6z5yMSMw4Wp7PFFSxmYpnSJuNeKhrTcROxhr0gR1
	+7NZf/UQA5D9IR8v/GUPKwN6joyC4R9kMMPyC6ZVk7KmFBRL43r5VDDMN3oYswC8XEn0oricBpon5
	qXv0tenogdweM8blaZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjIR-0000000A9Sg-3mty;
	Mon, 23 Dec 2024 14:20:35 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjHT-0000000A8vg-028T
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 14:19:36 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a9caa3726fso14346705ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734963573; x=1735568373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlKsDcG265GLTRuHGNMMDIoHE87S0dQc7oUcHfSD0xo=;
        b=h1XlBwlqZ/avXH8P0DAnya+P439rNGiW0djOrU9UYs8CdzaqYnMi9t5GNxV9HZOaef
         bRCecp3+r8VQUo4L4N3uoozqT0iaBCznHI4syl/Hzu42rPE2OpGiJPXjvRnGLOGcF4cD
         q+UbWqcIxVZmU03HzrdwphTkJnKg1K85qwQYaiUppurb9DUvFV3hSfFM+94GWTd23OAJ
         q5fDumD2j0jBnRV7v4+GbiMY/TFTOz7jiElnIvctSbn68cHjFtQugA9vl9ilevutGW6K
         VwkG6VEriODDc7mzTE3BqueXjMGfCMxQ8a2HxLxBeveIlraBNdMnLgeWtZQzKYWHDCVg
         MUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734963573; x=1735568373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlKsDcG265GLTRuHGNMMDIoHE87S0dQc7oUcHfSD0xo=;
        b=K5nlhyIvykz5+z8taKtdP7+TJUJ+v+urujShA2Vrn143n5RmO8dYkB9VvQYJXR65oL
         Hlqfm7JNtwFTPakvztByJs0LaGyOjQ3lUCndz1alhwB2jLE5ek9fgUirbW5LQEI9wS8Q
         bpLyN+K7mcO1OpEeSNP3LGwSTV+1WFkqYFCko+1Crc1hWQDgXDh8+yyYwOAjRQceJjWP
         u+MStooZ3xCOFTtM3RI/Zhd/oYl7k7tCAZ4NnmUow/0A4Y02fLxATvDBFnDZshYG/Pvd
         aadaGuWX4PeKhseaigjLhR/Keu1zls8pLWkmTHgbnjvIL1ZKAluXwypdh5s+OUE3+dCQ
         o7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUFQbRsAbqTmiGe/1iV8Te8BhDErQzMT59ycWMwJJibrL20SoxW+1UVIo2F6ON3LIgFqHLs1bUzT/d+2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzddN+Ib8+j/zNCbQGJJtHX4H1V5oKhhQPwT4aDovO84+cIskEJ
	FZlstY+4gtAGAe1A1QbUrGcEw7TqsL7Cs6QkM6Gc+BEDiQLl+vo6EMR7FRpIOcQbbBuBm1ynSRZ
	gFGYdGrQ0/+cRGoM+5otmFxB7MDyU7H5up5OpWQ==
X-Gm-Gg: ASbGncsMz1JDBc8yK6TAiSSyTlzBo9gWIbx8SIRZJEWO7DemVlo5RRx9nuc76Ls79Cn
	2xGY8TCqZ9d3Q3gtiOIAbY7CpUEjaddjgPQZeBHA=
X-Google-Smtp-Source: AGHT+IHT7JeacGaKf7+yPhFAeXWIA2+H/KV/q4bKowl5LHB+O1SpHIOeP9ZRh+8nxiuSwiyJGyjte+YTgeP6fBPIcQk=
X-Received: by 2002:a92:d703:0:b0:3ab:502c:b523 with SMTP id
 e9e14a558f8ab-3c02ceb2239mr110342355ab.4.1734963573524; Mon, 23 Dec 2024
 06:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com> <20241212-kvm_guest_stat-v1-3-d1a6d0c862d5@rivosinc.com>
In-Reply-To: <20241212-kvm_guest_stat-v1-3-d1a6d0c862d5@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Dec 2024 19:49:22 +0530
X-Gm-Features: AbW1kvYLaTndzKv1CpNodLd28lS6Xhq_vsaRN7L1uynktu-VhkkNsDjLYzKvJF0
Message-ID: <CAAhSdy24K3pkOR25Rbcvw6pRWXrKXdy0CH9CLeG77EqQRZTDnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: KVM: Add new exit statstics for redirected traps
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_061935_054373_7469F05E 
X-CRM114-Status: GOOD (  16.76  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMjoyN+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwga3ZtIGRvZXNuJ3QgZGVsZWdhdGUgdGhl
IGZldyB0cmFwcyBzdWNoIGFzIG1pc2FsaWduZWQKPiBsb2FkL3N0b3JlLCBpbGxlZ2FsIGluc3Ry
dWN0aW9uIGFuZCBsb2FkL3N0b3JlIGFjY2VzcyBmYXVsdHMgYmVjYXVzZSBpdAo+IGlzIG5vdCBl
eHBlY3RlZCB0byBvY2N1ciBpbiB0aGUgZ3Vlc3QgdmVyeSBmcmVxdWVudC4gVGh1cywga3ZtIGdl
dHMgYQo+IGNoYW5jZSB0byBhY3QgdXBvbiBpdCBvciBjb2xsZWN0IHN0YXRzdGljcyBhYm91dCBp
dCBiZWZvcmUgcmVkaXJlY3RpbmcKPiB0aGUgdHJhcHMgdG8gdGhlIGd1ZXN0Lgo+Cj4gV2UgY2Fu
IGNvbGxlY3QgYm90aCBndWVzdCBhbmQgaG9zdCB2aXNpYmxlIHN0YXRpc3RpY3MgZHVyaW5nIHRo
ZSB0cmFwcy4KPiBFbmFibGUgdGhlbSBzbyB0aGF0IGJvdGggZ3Vlc3QgYW5kIGhvc3QgY2FuIGNv
bGxlY3QgdGhlIHN0YXRzIGFib3V0Cj4gdGhlbSBpZiByZXF1aXJlZC4KCnMvV2UgY2FuIGNvbGxl
Y3QgLi4uL0NvbGxlY3QgLi4uLwoKPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgoKT3RoZXJ3aXNlLCBpdCBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCA1ICsrKysrCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDcgKysrKysrLQo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X2V4aXQuYyAgICAgICAgfCA1ICsrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAo+IGluZGV4IDM1ZWFiNmUwZjRhZS4uY2MzM2UzNWNkNjI4IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaAo+IEBAIC04Nyw2ICs4NywxMSBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfc3RhdCB7
Cj4gICAgICAgICB1NjQgY3NyX2V4aXRfa2VybmVsOwo+ICAgICAgICAgdTY0IHNpZ25hbF9leGl0
czsKPiAgICAgICAgIHU2NCBleGl0czsKPiArICAgICAgIHU2NCBpbnN0cl9pbGxlZ2FsX2V4aXRz
Owo+ICsgICAgICAgdTY0IGxvYWRfbWlzYWxpZ25lZF9leGl0czsKPiArICAgICAgIHU2NCBzdG9y
ZV9taXNhbGlnbmVkX2V4aXRzOwo+ICsgICAgICAgdTY0IGxvYWRfYWNjZXNzX2V4aXRzOwo+ICsg
ICAgICAgdTY0IHN0b3JlX2FjY2Vzc19leGl0czsKPiAgfTsKPgo+ICBzdHJ1Y3Qga3ZtX2FyY2hf
bWVtb3J5X3Nsb3Qgewo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCBlMDQ4ZGNjNmU2NWUuLjYwZDY4NGM3NmM1OCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1LmMKPiBAQCAtMzQsNyArMzQsMTIgQEAgY29uc3Qgc3RydWN0IF9rdm1fc3RhdHNfZGVzYyBr
dm1fdmNwdV9zdGF0c19kZXNjW10gPSB7Cj4gICAgICAgICBTVEFUU19ERVNDX0NPVU5URVIoVkNQ
VSwgY3NyX2V4aXRfdXNlciksCj4gICAgICAgICBTVEFUU19ERVNDX0NPVU5URVIoVkNQVSwgY3Ny
X2V4aXRfa2VybmVsKSwKPiAgICAgICAgIFNUQVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBzaWduYWxf
ZXhpdHMpLAo+IC0gICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGV4aXRzKQo+ICsgICAg
ICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGV4aXRzKSwKPiArICAgICAgIFNUQVRTX0RFU0Nf
Q09VTlRFUihWQ1BVLCBpbnN0cl9pbGxlZ2FsX2V4aXRzKSwKPiArICAgICAgIFNUQVRTX0RFU0Nf
Q09VTlRFUihWQ1BVLCBsb2FkX21pc2FsaWduZWRfZXhpdHMpLAo+ICsgICAgICAgU1RBVFNfREVT
Q19DT1VOVEVSKFZDUFUsIHN0b3JlX21pc2FsaWduZWRfZXhpdHMpLAo+ICsgICAgICAgU1RBVFNf
REVTQ19DT1VOVEVSKFZDUFUsIGxvYWRfYWNjZXNzX2V4aXRzKSwKPiArICAgICAgIFNUQVRTX0RF
U0NfQ09VTlRFUihWQ1BVLCBzdG9yZV9hY2Nlc3NfZXhpdHMpLAo+ICB9Owo+Cj4gIGNvbnN0IHN0
cnVjdCBrdm1fc3RhdHNfaGVhZGVyIGt2bV92Y3B1X3N0YXRzX2hlYWRlciA9IHsKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4
aXQuYwo+IGluZGV4IGFjZGNkNjE5Nzk3ZS4uNmUwYzE4NDEyNzk1IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0
LmMKPiBAQCAtMTk1LDIyICsxOTUsMjcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2V4aXQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgc3dpdGNoICh0
cmFwLT5zY2F1c2UpIHsKPiAgICAgICAgIGNhc2UgRVhDX0lOU1RfSUxMRUdBTDoKPiAgICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19JTExF
R0FMX0lOU04pOwo+ICsgICAgICAgICAgICAgICB2Y3B1LT5zdGF0Lmluc3RyX2lsbGVnYWxfZXhp
dHMrKzsKPiAgICAgICAgICAgICAgICAgcmV0ID0gdmNwdV9yZWRpcmVjdCh2Y3B1LCB0cmFwKTsK
PiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEVYQ19MT0FEX01JU0FMSUdO
RUQ6Cj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3BtdV9pbmNyX2Z3KHZjcHUsIFNC
SV9QTVVfRldfTUlTQUxJR05FRF9MT0FEKTsKPiArICAgICAgICAgICAgICAgdmNwdS0+c3RhdC5s
b2FkX21pc2FsaWduZWRfZXhpdHMrKzsKPiAgICAgICAgICAgICAgICAgcmV0ID0gdmNwdV9yZWRp
cmVjdCh2Y3B1LCB0cmFwKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNl
IEVYQ19TVE9SRV9NSVNBTElHTkVEOgo+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV9w
bXVfaW5jcl9mdyh2Y3B1LCBTQklfUE1VX0ZXX01JU0FMSUdORURfU1RPUkUpOwo+ICsgICAgICAg
ICAgICAgICB2Y3B1LT5zdGF0LnN0b3JlX21pc2FsaWduZWRfZXhpdHMrKzsKPiAgICAgICAgICAg
ICAgICAgcmV0ID0gdmNwdV9yZWRpcmVjdCh2Y3B1LCB0cmFwKTsKPiAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gICAgICAgICBjYXNlIEVYQ19MT0FEX0FDQ0VTUzoKPiAgICAgICAgICAgICAgICAg
a3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19BQ0NFU1NfTE9BRCk7
Cj4gKyAgICAgICAgICAgICAgIHZjcHUtPnN0YXQubG9hZF9hY2Nlc3NfZXhpdHMrKzsKPiAgICAg
ICAgICAgICAgICAgcmV0ID0gdmNwdV9yZWRpcmVjdCh2Y3B1LCB0cmFwKTsKPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEVYQ19TVE9SRV9BQ0NFU1M6Cj4gICAgICAgICAg
ICAgICAgIGt2bV9yaXNjdl92Y3B1X3BtdV9pbmNyX2Z3KHZjcHUsIFNCSV9QTVVfRldfQUNDRVNT
X1NUT1JFKTsKPiArICAgICAgICAgICAgICAgdmNwdS0+c3RhdC5zdG9yZV9hY2Nlc3NfZXhpdHMr
KzsKPiAgICAgICAgICAgICAgICAgcmV0ID0gdmNwdV9yZWRpcmVjdCh2Y3B1LCB0cmFwKTsKPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEVYQ19JTlNUX0FDQ0VTUzoKPgo+
IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
