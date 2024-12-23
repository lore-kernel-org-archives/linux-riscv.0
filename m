Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C532E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SswWGOjClp0b3vNGCEJEnulRLbQuejDGE6vErGomtto=; b=jRmeTcbPM2gJMv
	dnx8YTuqyZU3vMJqBRhRW9WzBso+mNLfeYLvQnDoZX+s3qoC0dj3+u7icOeKttZzfW5TgAf+DzQm0
	npc+dX/3YJTHQ2vGurT+SkHoojWjq5Oa5FN+5p4jayjsUP9TytXjPPtxbOqHfa8XCaMh1DLtyGlXB
	wlBr0wE/KmCx6qmg48lJKHWAv1mNgGh+d14WpZBhxhJdifGlKEnA3ZMFoNArVpEMx2aiLdU2K1jkY
	TqbP7dh/l5S2T7csMPsym+luQjgAljIXyVBDTd9OH1DXDYHOr3HVa8qo4n1MFJ0nppUUtrAVyFALL
	ZhOuOgW8lImAT9AfIlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlu0-0000000ASQG-3UI2;
	Mon, 23 Dec 2024 17:07:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlty-0000000ASPd-2MSy
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 17:07:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43618283d48so32630095e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 09:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734973648; x=1735578448; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wg4vjyVECW+ChvoAlL9UVmFUaeopt+mrSiXeDI2rDX8=;
        b=eOc7XzhUXfQL0u8KoiVnzfkJjpzAM/ta/kkSMff6fXvB8VWME8334J6oKTn/IZUW1D
         naLezwt6nmEXhgdA5HRZ82dxfK4DA9HvnlvMEUtcC6LmyTV9ggaY/3U/E4hsG8tGILdj
         23uJzTpU8KElUBfT59PWwTEhQNQJLyiMllZjtHwVt66Bh+cxnRf/AFd3oLaAhljvUpip
         XAsyddUyYJQ8q5G+aDBaLEj/bUit0CMYLdy6y4hiCv2Qm4AQNCk58/soMhYuoHd3aknE
         Bq1Zis07bCFWmAt9SsU+K5EZFGp0jUj6VQPNG4Gj0FF4c2ZXD3XrXdplMVc7NYPIdN4H
         DkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734973648; x=1735578448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg4vjyVECW+ChvoAlL9UVmFUaeopt+mrSiXeDI2rDX8=;
        b=URXiQToaz2LbdBG5y3yfKbpRBABIweNhuU4MV/J3Zic2NgHgmccmNdpTiCfN8lTL5B
         yHeApx29KyTj9OeGKwKD2ITeMNagY9gBTBEZo01bXUR5EyJQVNqoNIm44kQsxCewBro+
         6j34DCgFoqQAeLAsIWbvLf/ez8Hk93aj/C+DXKSfQaj1Dm97cLL8IY2DpLaKobl9kLsn
         iAZizqEXLjMudKcOm1BXwLyIym90pcxzjpleW9IQBtNLTBAPfpIGliHvSvsqKJna+wIc
         65frSR+G8XlBuKc6B+22XganMdToC+zYsg2ZTwXAGTfJnghbctGTXSfSuFy/UiMisd35
         XN9g==
X-Forwarded-Encrypted: i=1; AJvYcCUGsn+WpGp72X0CP7gu+uQ9x0GuQkcCLjrPDtpH/F30ICmrGvuRBONpiAs7z0Fg9rNCoaw8ppnzC67hqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC63YaktqbGmKAFEoNI9aR85jUROhQmcTvH8+HrPpvxLft8Sqw
	h0J493IoCKITgyISfp7wSW8DzYxInmTdYEBOxO0fQJ1jT2VF5UDEr3lHKmqPZBM=
X-Gm-Gg: ASbGncvpHf+kteLB1Rn3CO56ZMCwWbZhqcTimGb+ZHVXChtAr0VwGQbBj/qb8kWHa7Y
	4hBJuUTjEFxka/FF5zB4zgQtlrbqn2tQGw+mKetxlGaMyRBOXh2D3Ex1YTOji0UmbVP1n/rXiUg
	4Yn0J4K0VqURyvpSgRfDGCaIB+ULsb0LFRpGgmqHSneN2LEQ2oICWrirqKqlBGtym5MgnjFQINI
	rOC48/6r2S9ZEAxlyMEyciHV0wg/maHAVIFEQGvD9yrdFRNGDnhePFH5xrnJKdYwwkOW6ZZNrBM
	iADmbBD75A==
X-Google-Smtp-Source: AGHT+IEcAZ0iEQknuE0BYf6PXaHye1ahgskuaFBYa67Vj6CCVIk1qZIaM/vSMsXf9b1KEGu1yXX7Vg==
X-Received: by 2002:a05:600c:3554:b0:434:9934:575 with SMTP id 5b1f17b1804b1-436686461d6mr124149995e9.16.1734973648340;
        Mon, 23 Dec 2024 09:07:28 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833280sm11914043f8f.40.2024.12.23.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:07:27 -0800 (PST)
Date: Mon, 23 Dec 2024 18:07:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com, peterz@infradead.org, 
	parri.andrea@gmail.com, will@kernel.org, longman@redhat.com, boqun.feng@gmail.com, 
	arnd@arndb.de, alexghiti@rivosinc.com, rkrcmar@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 0/3] riscv: Add PARAVIRT_SPINLOCKS support
Message-ID: <20241223-165e7b7ee58e2dede8bfd830@orel>
References: <20241222033917.1754495-1-guoren@kernel.org>
 <CAAhSdy1EXTmuCvMp4HK0Ozg42Zw2XzCjaS7kGi-aXQ__r=taPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1EXTmuCvMp4HK0Ozg42Zw2XzCjaS7kGi-aXQ__r=taPw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_090730_610604_F630C39C 
X-CRM114-Status: GOOD (  17.93  )
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

T24gTW9uLCBEZWMgMjMsIDIwMjQgYXQgMDE6NDQ6NTBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBTdW4sIERlYyAyMiwgMjAyNCBhdCA5OjA54oCvQU0gPGd1b3JlbkBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+
Cj4gPgo+ID4gUGFyYXZpcnR1YWxpemVkIHNwaW5sb2NrcyBhbGxvdyBhIHVuZmFpciBxc3Bpbmxv
Y2sgdG8gcmVwbGFjZSB0aGUKPiA+IHRpY2tldC1sb2NrIG9yIG5hdGl2ZSBmYWlyIHFzcGlubG9j
ayBpbXBsZW1lbnRhdGlvbiB3aXRoIHNvbWV0aGluZwo+ID4gdmlydHVhbGl6YXRpb24tZnJpZW5k
bHksIGZvciBleGFtcGxlLCBoYWx0IHRoZSB2aXJ0dWFsIENQVSByYXRoZXIKPiA+IHRoYW4gc3Bp
bm5pbmcuCj4gPgo+ID4gWW91IGNvdWxkIG9ic2VydmUgdGhlIHBhcmF2aXJ0IHFzcGlubG9jayBp
bnRlcm5hbCB3b3JrIHNpdHVhdGlvbiB3aXRoCj4gPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5n
L3RyYWNlOgo+ID4KPiA+IGxzIC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL3BhcmF2
aXJ0Lwo+ID4gIGVuYWJsZSAgIGZpbHRlciAgIHB2X2tpY2sgIHB2X3dhaXQKPiA+Cj4gPiBlY2hv
IDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy9wYXJhdmlydC9lbmFibGUKPiA+
IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL3RyYWNlCj4gPiAgZW50cmllcy1pbi1idWZm
ZXIvZW50cmllcy13cml0dGVuOiAzMzkyNy8zMzkyNyAgICNQOjEyCj4gPgo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBfLS0tLS09PiBpcnFzLW9mZi9CSC1kaXNhYmxlZAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8gXy0tLS09PiBuZWVkLXJlc2NoZWQKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgLyBfLS0tPT4gaGFyZGlycS9zb2Z0aXJx
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8fCAvIF8tLT0+IHByZWVtcHQtZGVw
dGgKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx8fCAvIF8tPT4gbWlncmF0ZS1k
aXNhYmxlCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8fHx8IC8gICAgIGRlbGF5
Cj4gPiAgICAgICAgICAgIFRBU0stUElEICAgICBDUFUjICB8fHx8fCAgVElNRVNUQU1QICBGVU5D
VElPTgo+ID4gICAgICAgICAgICAgICB8IHwgICAgICAgICB8ICAgfHx8fHwgICAgIHwgICAgICAg
ICB8Cj4gPiAgICAgICAgICAgICAgc2gtMTAwICAgICBbMDAxXSBkLi4yLiAgICAyOC4zMTIyOTQ6
IHB2X3dhaXQ6IGNwdSAxIG91dCBvZiB3ZmkKPiA+ICAgICAgICAgIDxpZGxlPi0wICAgICAgIFsw
MDBdIGQuaDQuICAgIDI4LjMyMjAzMDogcHZfa2ljazogY3B1IDAga2ljayB0YXJnZXQgY3B1IDEK
PiA+ICAgICAgICAgICAgICBzaC0xMDAgICAgIFswMDFdIGQuLjIuICAgIDMwLjk4MjYzMTogcHZf
d2FpdDogY3B1IDEgb3V0IG9mIHdmaQo+ID4gICAgICAgICAgPGlkbGU+LTAgICAgICAgWzAwMF0g
ZC5oNC4gICAgMzAuOTkzMjg5OiBwdl9raWNrOiBjcHUgMCBraWNrIHRhcmdldCBjcHUgMQo+ID4g
ICAgICAgICAgICAgIHNoLTEwMCAgICAgWzAwMl0gZC4uMi4gICAgNDQuOTg3NTczOiBwdl93YWl0
OiBjcHUgMiBvdXQgb2Ygd2ZpCj4gPiAgICAgICAgICA8aWRsZT4tMCAgICAgICBbMDAwXSBkLmg0
LiAgICA0NC45ODkwMDA6IHB2X2tpY2s6IGNwdSAwIGtpY2sgdGFyZ2V0IGNwdSAyCj4gPiAgICAg
ICAgICA8aWRsZT4tMCAgICAgICBbMDAzXSBkLnMzLiAgICA1MS41OTM5Nzg6IHB2X2tpY2s6IGNw
dSAzIGtpY2sgdGFyZ2V0IGNwdSA0Cj4gPiAgICAgICByY3Vfc2NoZWQtMTUgICAgICBbMDA0XSBk
Li4yLiAgICA1MS41OTUxOTI6IHB2X3dhaXQ6IGNwdSA0IG91dCBvZiB3ZmkKPiA+IGxvY2tfdG9y
dHVyZV93ci0xMTUgICAgIFswMDRdIC4uLjIuICAgIDUyLjY1NjQ4MjogcHZfa2ljazogY3B1IDQg
a2ljayB0YXJnZXQgY3B1IDIKPiA+IGxvY2tfdG9ydHVyZV93ci0xMTMgICAgIFswMDJdIGQuLjIu
ICAgIDUyLjY1OTE0NjogcHZfd2FpdDogY3B1IDIgb3V0IG9mIHdmaQo+ID4gbG9ja190b3J0dXJl
X3dyLTExNCAgICAgWzAwOF0gZC4uMi4gICAgNTIuNjU5NTA3OiBwdl93YWl0OiBjcHUgOCBvdXQg
b2Ygd2ZpCj4gPiBsb2NrX3RvcnR1cmVfd3ItMTE0ICAgICBbMDA4XSBkLi4yLiAgICA1Mi42NjM1
MDM6IHB2X3dhaXQ6IGNwdSA4IG91dCBvZiB3ZmkKPiA+IGxvY2tfdG9ydHVyZV93ci0xMTMgICAg
IFswMDJdIC4uLjIuICAgIDUyLjY2NjEyODogcHZfa2ljazogY3B1IDIga2ljayB0YXJnZXQgY3B1
IDgKPiA+IGxvY2tfdG9ydHVyZV93ci0xMTQgICAgIFswMDhdIGQuLjIuICAgIDUyLjY2NzI2MTog
cHZfd2FpdDogY3B1IDggb3V0IG9mIHdmaQo+ID4gbG9ja190b3J0dXJlX3dyLTExNCAgICAgWzAw
OV0gLm4uMi4gICAgNTMuMTQxNTE1OiBwdl9raWNrOiBjcHUgOSBraWNrIHRhcmdldCBjcHUgMTEK
PiA+IGxvY2tfdG9ydHVyZV93ci0xMTMgICAgIFswMDJdIGQuLjIuICAgIDUzLjE0MzMzOTogcHZf
d2FpdDogY3B1IDIgb3V0IG9mIHdmaQo+ID4gbG9ja190b3J0dXJlX3dyLTExNiAgICAgWzAwN10g
ZC4uMi4gICAgNTMuMTQzNDEyOiBwdl93YWl0OiBjcHUgNyBvdXQgb2Ygd2ZpCj4gPiBsb2NrX3Rv
cnR1cmVfd3ItMTE4ICAgICBbMDAwXSBkLi4yLiAgICA1My4xNDM0NTc6IHB2X3dhaXQ6IGNwdSAw
IG91dCBvZiB3ZmkKPiA+IGxvY2tfdG9ydHVyZV93ci0xMTUgICAgIFswMDhdIGQuLjIuICAgIDUz
LjE0MzQ4MTogcHZfd2FpdDogY3B1IDggb3V0IG9mIHdmaQo+ID4gbG9ja190b3J0dXJlX3dyLTEx
NyAgICAgWzAxMV0gZC4uMi4gICAgNTMuMTQzNTIyOiBwdl93YWl0OiBjcHUgMTEgb3V0IG9mIHdm
aQo+ID4gbG9ja190b3J0dXJlX3dyLTExNyAgICAgWzAxMV0gLi4uMi4gICAgNTMuMTQzOTg3OiBw
dl9raWNrOiBjcHUgMTEga2ljayB0YXJnZXQgY3B1IDgKPiA+IGxvY2tfdG9ydHVyZV93ci0xMTUg
ICAgIFswMDhdIC4uLjIuICAgIDUzLjE0NDI2OTogcHZfa2ljazogY3B1IDgga2ljayB0YXJnZXQg
Y3B1IDcKPiA+Cj4gPiBUaGlzIHNlcmllcyBpcyBzcGxpdCBmcm9tIFsxXS4KPiA+Cj4gPiBbMV06
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMxMjI1MTI1ODQ3LjI3Nzg2
MzgtMS1ndW9yZW5Aa2VybmVsLm9yZy8KPiA+Cj4gPiBHdW8gUmVuICgzKToKPiA+ICAgUklTQy1W
OiBwYXJhdmlydDogQWRkIHB2cXNwaW5sb2NrIEtWTSBiYWNrZW5kCj4gPiAgIFJJU0MtVjogcGFy
YXZpcnQ6IEFkZCBwdnFzcGlubG9jayBmcm9udGVuZAo+ID4gICBSSVNDLVY6IHBhcmF2aXJ0OiBw
dnFzcGlubG9jazogQWRkIHRyYWNlIHBvaW50IGZvciBwdl9raWNrL3dhaXQKPiAKPiBUaGlzIHNo
b3VsZCBiZSBhbiBSRkMgc2VyaWVzIHVudGlsIHRoZSBjb3JyZXNwb25kaW5nIFNCSSBleHRlbnNp
b24KPiBpcyBmcm96ZW4uIEFGQUlLLCBubyBvbmUgaGFzIHBvc3RlZCBhbnkgU0JJIGV4dGVuc2lv
biBpbiB0aGlzIGNvbnRleHQKPiBvbiBhbnkgb2YgdGhlIFJWSSBtYWlsaW5nIGxpc3RzLgo+IAo+
IFBsZWFzZSB3b3JrIHdpdGggdGhlIFBSUyBURyBhbmQgSHlwZXJ2aXNvcnMgU0lHIGZvciB0aGUg
cHJvcG9zZWQKPiBTQkkgZXh0ZW5zaW9uLgo+CgpJIHByb21pc2VkIEd1byBJJ2QgaGVscCBvdXQg
Ynkgd3JpdGluZyBhIGRyYWZ0IGZvciB0aGUgU0JJIGV4dGVuc2lvbi4gSSdsbAp0cnkgdG8gZ2V0
IHNvbWV0aGluZyBwb3N0ZWQgdGhpcyB3ZWVrLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
