Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C14BC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 12:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpTz3v+RniBWAI26pEfsfr4MxJl3hEHXLxSKcgyL1Mc=; b=Y43s+02E3u9/oO
	Q7+T/dURobUTUxVyTXxJkCiqZAz18eo6SseZE/gueb2RppOe9j4ewnnshLIXRIIhoBaxC53jxr4Y2
	gFReGTg1QAGVvhCzCRNG1/Wm/wP+sIijmT7b0ipJ9JU1dsPiX1g4oRi09Djh8gFXka9PRDLfVbCSF
	zYxc9bkN3UpLohdM+65xa60OXy7amRPfxL8U68MWtNXOiNUinhhUUcNypXFHMigJwL3tO3jLSKfMS
	xGmiC2KDipnOMdimADticH51lkdT5uDPlWxzYfHPMVoUfBMnf5TuoArZ3nXrmyEnb8X4s/NiW8Svg
	ocq4kemxQxb/aZbNFA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozzKY-008Yb1-Iv; Tue, 29 Nov 2022 12:03:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozzKV-008YaH-83
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 12:03:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id l7so10992229pfl.7
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 04:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4Uj47DJf73FxZb3P8g6O9fWjUxsQOikSyAAeVgUhcA=;
        b=P35CotWzaM2P3ovyTan+dW0r95aJEGTqjZRrro4IiaN6r7sLG4x5QwwOxC23vuRxBS
         obQTCzC9TcZWGZ6UJMvVn5Vx+c1fM2MDcFhO9fPBF0T2dhWebBUy7sEV01KAZdFmia06
         tKNoS2f0xttHee5GmSVIqbBmDeBplGQphNx0/efdoc9iGvePyTwo3Ii3L6LjPJdRqT+d
         dg/y7Svxyg4M4sBdd7JWKc2xDe2wYQhZGolbC7RCA1tF1rZtboNQEadSqoEXdd2q5ae7
         vlK4rXNMG+4DJf3GtDeb2ylVB2Gg4yds1cCpf1uROZQEZojPAkDLyshkQuYBHvA+3eXj
         FpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4Uj47DJf73FxZb3P8g6O9fWjUxsQOikSyAAeVgUhcA=;
        b=v5KMvDCZo5+MoB1TirdUMBz/sesY/eA5uMliZUXgg7pP4TwxjL0zklaM/SFqd+9KMI
         5lu+9UlkNLNOm+5XTaQ6qOY+NE5gUIXmcXEx+9RYCU/EhTO9qMpZEtwOI7n+DNulzDAc
         vC0EjPEh8BEQ6Lxv74sP6NLuCtZd2WMvKxVIPX2SK9+iG2ILVYryXR/QIZrjaSZt/gFf
         QldSTUezi/lT482gVVHDPBTGyjRgdmZdsSc4SJuM2QdXCJUSa2VAoIgWiUz8QUBh/Vlo
         Vg8WN110xfEzcdpotD+xQ5HkpvPJ9V+Gb0RmqrG3BJDqWLkFwNteghX1d1UcOo3Opnk1
         M+SQ==
X-Gm-Message-State: ANoB5pk8afEdwmPNpm4SO2OW22c1boE4EQKgxm26ZS+XO64ULMxmRwpW
	nK9w0k907LeXofCePuaNoWWZeX3EdbaBfhM/JIM=
X-Google-Smtp-Source: AA0mqf4/dopHy4Uoq3WIsq7+rfzDdzcrMyrEbwpKPtKtcK0vYk4/gyqUWPj6A+PfWF8PSjL4A+A7Ty5zl3QIssAcOCM=
X-Received: by 2002:aa7:8709:0:b0:572:2189:84ef with SMTP id
 b9-20020aa78709000000b00572218984efmr37192850pfo.28.1669723393830; Tue, 29
 Nov 2022 04:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20221129033230.255947-1-guoren@kernel.org> <20221129033230.255947-7-guoren@kernel.org>
In-Reply-To: <20221129033230.255947-7-guoren@kernel.org>
From: Song Shuai <suagrfillet@gmail.com>
Date: Tue, 29 Nov 2022 12:03:02 +0000
Message-ID: <CAAYs2=hOY+ib_OYwUfnM10kwyqte7C7=efTL00VkVKHWM9HbAw@mail.gmail.com>
Subject: Re: [PATCH V4 6/7] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 support
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	andy.chiu@sifive.com, mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_040315_308213_BCE9272D 
X-CRM114-Status: GOOD (  21.63  )
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

PGd1b3JlbkBrZXJuZWwub3JnPiDkuo4yMDIy5bm0MTHmnIgyOeaXpeWRqOS6jCAwMzozM+WGmemB
k++8mgo+Cj4gRnJvbTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+Cj4gVGhp
cyBwYXRjaCBhZGRzIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHN1cHBvcnQgZm9y
IFJJU0MtVi4KPgo+IHNlbGVjdCB0aGUgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMg
dG8gcHJvdmlkZSB0aGUKPiByZWdpc3Rlcl9mdHJhY2VfZGlyZWN0W19tdWx0aV0gaW50ZXJmYWNl
cyBhbGxvd2luZyB1c2VycyB0byByZWdpc3Rlcgo+IHRoZSBjdXN0b21lZCB0cmFtcG9saW5lIChk
aXJlY3RfY2FsbGVyKSBhcyB0aGUgbWNvdW50IGZvciBvbmUgb3IKPiBtb3JlIHRhcmdldCBmdW5j
dGlvbnMuIEFuZCBtb2RpZnlfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGFyZSBhbHNvCj4gcHJvdmlk
ZWQgZm9yIG1vZGlmeWluZyBkaXJlY3RfY2FsbGVyLgo+Cj4gVG8gbWFrZSB0aGUgZGlyZWN0X2Nh
bGxlciBhbmQgdGhlIG90aGVyIGZ0cmFjZSBob29rcyAoZWcuIGZ1bmN0aW9uL2ZncmFwaAo+IHRy
YWNlciwga1tyZXRdcHJvYmVzKSBjby1leGlzdCwgYSB0ZW1wb3JhcnkgcmVnaXN0ZXIgaXMgbm9t
aW5hdGVkIHRvCj4gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2NhbGxlciBpbiBmdHJhY2Vf
cmVnc19jYWxsZXIuIEFmdGVyIHRoZQo+IHNldHRpbmcgb2YgdGhlIGFkZHJlc3MgZGlyZWN0X2Nh
bGxlciBieSBkaXJlY3Rfb3BzLT5mdW5jIGFuZCB0aGUKPiBSRVNUT1JFX1JFR1MgaW4gZnRyYWNl
X3JlZ3NfY2FsbGVyLCBkaXJlY3RfY2FsbGVyIHdpbGwgYmUganVtcGVkIHRvCj4gYnkgdGhlIGBq
cmAgaW5zdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWls
LmNvbT4KPiBUZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tj
b25maWcgICAgICAgICAgICAgIHwgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNl
LmggfCA2ICsrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMgIHwgNCArKysr
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDFkMGU1ODM4YjEx
Yi4uMjgyODUzN2FiZmNkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0yNzgsNiArMjc4LDcgQEAgY29uZmlnIEFSQ0hfUlY2
NEkKPiAgICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0lOVDEyOCBpZiBDQ19IQVNfSU5UMTI4
Cj4gICAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZiAhWElQX0tFUk5FTCAmJiBN
TVUgJiYgJChjYy1vcHRpb24sLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9OCkKSSBub3RpY2Vk
IHRoaXMgY2Mtb3B0aW9uIHVzZXMgdGhlICctZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT04JyB0
bwpqdWRnZSBpZiB0aGUgY29tcGlsZXIgc3VwcG9ydHMgdGhpcyBvcHRpb24uClNob3VsZCB3ZSBr
ZWVwIHVwIHdpdGggdGhlIENDX0ZMQUdTX0ZUUkFDRSBtb2RpZmllZCBpbiAoInJpc2N2OgpmdHJh
Y2U6IFJlZHVjZSB0aGUgZGV0b3VyIGNvZGUgc2l6ZSB0byBoYWxmIiksCm9yIGZvbGxvdyB0aGUg
cGFyaXNjIGFyY2hpdGVjdHVyZSB0byBzZXQgdGhlIHZhbHVlIGFzICcxLDEnIGluIHRoZQpjYXNl
IG9mIHRoZSBDQ19GTEFHU19GVFJBQ0UgaXMgbm90IGNvbnN0YW50LgpgYGAKLi9hcmNoL3Bhcmlz
Yy9NYWtlZmlsZTo3NTpDQ19GTEFHU19GVFJBQ0UgOj0KLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50
cnk9JChOT1BfQ09VTlQpLCQoc2hlbGwgZWNobwokJCgoJChOT1BfQ09VTlQpLTEpKSkKLi9hcmNo
L3BhcmlzYy9LY29uZmlnOjcwOiAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZgok
KGNjLW9wdGlvbiwtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT0xLDEpCmBgYAo+ICAgICAgICAg
c2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTIGlmIEhBVkVfRFlOQU1JQ19GVFJB
Q0UKPiArICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExT
Cj4gICAgICAgICBzZWxlY3QgSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRCBpZiAhWElQX0tFUk5F
TAo+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSCj4gICAgICAgICBz
ZWxlY3QgSEFWRV9GVU5DVElPTl9UUkFDRVIgaWYgIVhJUF9LRVJORUwgJiYgIVBSRUVNUFRJT04K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiBpbmRleCA4NGY4NTZhMzI4NmUuLjQ1MzlmMTBmZWE1
NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+IEBAIC0xMTQsNiArMTE0LDEyIEBAIHN0
cnVjdCBmdHJhY2VfcmVnczsKPiAgdm9pZCBmdHJhY2VfZ3JhcGhfZnVuYyh1bnNpZ25lZCBsb25n
IGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBmdHJhY2Vfb3BzICpvcCwgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncyk7Cj4gICNkZWZp
bmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRyYWNlX2dyYXBoX2Z1bmMKPiArCj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBhcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVn
cywgdW5zaWduZWQgbG9uZyBhZGRyKQo+ICt7Cj4gKyAgICAgICAgICAgICAgIHJlZ3MtPnQxID0g
YWRkcjsKPiArfQo+ICsKPiAgI2VuZGlmIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JF
R1MgKi8KPgo+ICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL21jb3VudC1keW4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4u
Uwo+IGluZGV4IDQ2NmM2ZWYyMTdiMS4uZmVmN2M0NjBmOTkxIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL21jb3VudC1keW4uUwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3Vu
dC1keW4uUwo+IEBAIC0yMzIsNiArMjMyLDcgQEAgRU5EUFJPQyhmdHJhY2VfY2FsbGVyKQo+Cj4g
ICNlbHNlIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiAgRU5UUlkoZnRy
YWNlX3JlZ3NfY2FsbGVyKQo+ICsgICAgICAgbW92ZSAgICB0MSwgemVybwo+ICAgICAgICAgU0FW
RV9BQklfUkVHUyAxCj4gICAgICAgICBQUkVQQVJFX0FSR1MKPgo+IEBAIC0yNDEsNyArMjQyLDEw
IEBAIGZ0cmFjZV9yZWdzX2NhbGw6Cj4KPgo+ICAgICAgICAgUkVTVE9SRV9BQklfUkVHUyAxCj4g
KyAgICAgICBibmV6ICAgIHQxLC5MZGlyZWN0Cj4gICAgICAgICBqciB0MAo+ICsuTGRpcmVjdDoK
PiArICAgICAgIGpyIHQxCj4gIEVORFBST0MoZnRyYWNlX3JlZ3NfY2FsbGVyKQo+Cj4gIEVOVFJZ
KGZ0cmFjZV9jYWxsZXIpCj4gLS0KPiAyLjM2LjEKPgoKCi0tIApUaGFua3MsClNvbmcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
