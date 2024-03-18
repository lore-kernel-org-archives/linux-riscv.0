Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409EC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 21:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6x5puF00dBP0ObdKJ5IElmxAEfbKxiRWnHRQnWIKM8=; b=1Abf9DhrE99QVa
	zUP6MNTy5Q43FFD5ab4NbvZXF1R/dOahHh5kFigoKi+V1iiH2xL/4q74qYruFfoya0+76LmGmMJgC
	v72OtVwP4/tKC8M7iatoEVwKCoyWsFg4ryXWzAEwnf8Q/JucuI3UV9CZsT3+F5zvSqIGFYuMPGacb
	S+AwUuafJOtdE4KCCC9GaDNSAwcwVEb17oD0qca2lKdE1T7SJezYEEBDN6U/WkM3hlFkxqRF/SAEY
	ek4qQUXwGfomqi6k9MUAeEpxe7gJeNBh/caENHnWtly+TgEgP1AOmN18qG73FuIxFBtxxjGH6MwaP
	WcAdHUdFrIrdkJzv2XTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKep-0000000AEyr-0mAU;
	Mon, 18 Mar 2024 21:36:35 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKel-0000000AEvs-041e
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 21:36:32 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-78a0ab10316so74433685a.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710797784; x=1711402584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=M6gFFGFx21pKN/0Zx30g6pDYIWmui8q/6G0e5vM6TESZH6vrdnwviaPnrvo/SLPSI0
         z7hZ0G7a2B7oVOZZyVBZb7M/QurzWN0b+5NaupAvklJCBGL40CxaZQLnLaMNHWflvus8
         ixPD6zAU8M1wTSMy1+3hhIxnGbXaIhpzgLEjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710797784; x=1711402584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=K/9MjmsQjsxvUL22SJaIq7tTVbHGPJ+b1cwEa51JPxzub9tMQX/w+2Nk3bfFTUR5NQ
         rc/Ww5mpQGtoDsk7POzRcHq+KJkMrFBsEhGI7k/wiCZ8DNAckKl7cO1x9xN/3sKmfom8
         +2Uq5ahKkZ2EMEdE+JOD6EGgFEYeq8tph/RzNWWSNRcG7ieRFWvjnPfsz+zW23VUuu3j
         5vvEDTxn9sluwe4KjUv6fUH/h5WI+3uS9bpf7T3d681t24uCmtP8vbv+2RJHAnaKO4sc
         W3LFNRJHwUG5rj0KgqisEPXKOrxs3xJw1hCLb27OifHAR1YQTvmPcbRkRtHX3gFzHyqd
         vilQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2LldeSsPEYEBF6sZ5SqI/K5/VmGgszjthpc1bOvruoVAVxABXapdkl0wF8CK1siW+FiqnqG98QwiTF9IDjSxAffpvKw03Ta1ISPdOlXcQ
X-Gm-Message-State: AOJu0Yxn5wvTJzpP2tk82wz75ZW8wolA3zxehBmBjTRuwbwQYOpY1zy0
	isK/ncVuoZrPl09XSphSf/pI9Igt5gezozR7dP2N3+wHeWkgLMGlAJg7gmaMbMjwOyZOL/WdD9c
	=
X-Google-Smtp-Source: AGHT+IEIPJihRo73bQ8WM5SI7qBuZ8XoCefRbA59Y4JcizMdYFd8yKVAW2KTfEmodBjOksBdKBOd5A==
X-Received: by 2002:a05:620a:4154:b0:789:f3ac:1750 with SMTP id k20-20020a05620a415400b00789f3ac1750mr1451403qko.9.1710797784503;
        Mon, 18 Mar 2024 14:36:24 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id l4-20020ae9f004000000b00788744ccaecsm4885451qkg.96.2024.03.18.14.36.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 14:36:23 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42ee0c326e8so77721cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 14:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/LS7uWFj6/norLPTE5s2Osn1b56eteYhXee+uxUqEV+H+22hMmF01G+I1YBbzWHZze5h7+/LaNrFQNk+O/BAja6I/cH3vdYzNI0xdVLBG
X-Received: by 2002:a05:622a:50e:b0:430:b590:e88c with SMTP id
 l14-20020a05622a050e00b00430b590e88cmr111577qtx.6.1710797782513; Mon, 18 Mar
 2024 14:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud>
In-Reply-To: <20240316-herring-skies-6ee1d4a9c0d2@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Mar 2024 14:36:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Conor Dooley <conor@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Amrit Anand <quic_amrianan@quicinc.com>, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_143631_105623_BC425C9A 
X-CRM114-Status: GOOD (  29.40  )
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

SGksCgpPbiBTYXQsIE1hciAxNiwgMjAyNCBhdCA5OjUx4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25v
ckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgTWFyIDE2LCAyMDI0IGF0IDA0OjIwOjAz
UE0gKzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDE0LCAyMDI0IGF0
IDAyOjIwOjM4UE0gKzAwMDAsIENhbGViIENvbm5vbGx5IHdyb3RlOgo+ID4gPiBPbiAxNC8wMy8y
MDI0IDEyOjExLCBBbXJpdCBBbmFuZCB3cm90ZToKPiA+ID4gMi4gQSB0b3AgbGV2ZWwgYm9hcmQt
aWQgcHJvcGVydHkgdGhhdCBpc24ndCBuYW1lc3BhY2VkIGltcGxpZXMgdGhhdCBpdAo+ID4gPiBp
c24ndCB2ZW5kb3Igc3BlY2lmaWMsIGJ1dCB0aGUgcHJvcG9zZWQgaW1wbGVtZW50YXRpb24gZG9l
c24ndCBldmVuCj4gPiA+IHByZXRlbmQgdG8gYmUgdmVuZG9yIGFnbm9zdGljLgo+ID4KPiA+IEkg
cG9pbnRlZCBvdXQgcHJldmlvdXNseSB0aGF0IHRoZSBDaHJvbWVib29rIGd1eXMgaGFkIHNvbWUg
c2ltaWxhcgo+ID4gaXNzdWVzIHdpdGggZHRiIHNlbGVjdGlvbiB3aGVuIHRoZSBPRU0gdmFyaWVz
IHBhcnRzIGJ1dCB0aGVyZSBkb2VzIG5vdAo+ID4gc2VlbSB0byBiZSBhbnkgb2YgdGhlbSBvbiBD
QyBoZXJlLgo+Cj4gVGhhdCdzIG1heWJlIGEgYml0IGhhcnNoIG9mIG1lIGFjdHVhbGx5LCBJIHNl
ZSB0aGF0IHRoZXJlJ3MgYQo+IGNocm9tZS1wbGF0Zm9ybSBhZGRyZXNzIG9uIENDLCBidXQgSSBk
b24ndCBrbm93IGlmIHRoYXQncyBnb25uYSByZWFjaAo+IHRoZSBndXlzIHRoYXQgd29yayBvbiB0
aGVzZSBkZXZpY2VzIChDaGVuLVl1IFRzYWkgYW5kIERvdWcgQW5kZXJzb24gaW4KPiBwYXJ0aWN1
bGFyKS4KClRoYW5rcyBmb3IgdGhlIENDLiBZZWFoLCBJIGRvbid0IHdhdGNoIHRoZSAiY2hyb21l
LXBsYXRmb3JtIiBsaXN0Cm15c2VsZiwgdGhvdWdoIG1heWJlIEkgc2hvdWxkLi4uCgpUaGUgQ2hy
b21lYm9vayBib290IGZsb3cgYW5kIGhvdyB3ZSd2ZSBoYW5kbGVkIHRoaXMgc28gZmFyIGlzCmRv
Y3VtZW50ZWQgaW4gdGhlIGtlcm5lbCBbMV0uIFRoaXMgbWV0aG9kIGlzIHdoYXQgd2UndmUgYmVl
biB1c2luZwood2l0aCBzbGlnaHQgbW9kaWZpY2F0aW9ucyBvdmVyIHRoZSB5ZWFycykgc2luY2Ug
dGhlIGVhcmxpZXIgQVJNCkNocm9tZWJvb2tzIGFuZCBpcywgSSBiZWxpZXZlLCBzdXBwb3J0ZWQg
aW4gYm90aCB0aGUgZGVwdGhjaGFyZ2UKbG9hZGVyICh1c2VkIGluIENocm9tZWJvb2tzKSBhbmQg
YWxzbyBpbiBVLUJvb3QsIHRob3VnaCBpdCdzIHBvc3NpYmxlCig/KSB0aGF0IHRoZSBVLUJvb3Qg
cnVsZXMgbWlnaHQgdmFyeSBldmVyIHNvIHNsaWdodGx5LiBJIGhhdmVuJ3QgdHJpZWQKdXNpbmcg
VS1Cb290IHRvIGJvb3QgYSBDaHJvbWVib29rIGluIHllYXJzLgoKVGhlIGN1cnJlbnQgd2F5IHRo
aW5ncyB3b3JrIGZvciBDaHJvbWVib29rcyBpbnZvbHZlcyBhIGhlYXZ5IGFtb3VudCBvZgpkdXBs
aWNhdGlvbi4gV2UgYnVuZGxlIGFuIGVudGlyZSAiRFRCIiBmb3IgZXZlcnkgcmVsZXZhbnQKYm9h
cmQvcmV2L3NrdSBjb21iaW5hdGlvbiBldmVuIHRob3VnaCBtYW55IG9mIHRob3NlIERUQnMgYXJl
IDk5JSB0aGUKc2FtZSBhcyB0aGUgb3RoZXIgb25lcy4gVGhlIERUQnMgaGF2ZSBiZWVuIHJlbGF0
aXZlbHkgc21hbGwgYW5kIHdlCmNvbXByZXNzIHRoZW0gc28gdGhpcyBoYXNuJ3QgYmVlbiBhIG1h
c3NpdmUgZGVhbCwgYnV0IGl0J3MgYWx3YXlzIGJlZW4Kb24gdGhlIFRPRE8gbGlzdCB0byBjb21l
IHVwIHdpdGggYSBzY2hlbWUgdG8gdXNlIERUIG92ZXJsYXlzLiBXZSd2ZQphbHNvIHRhbGtlZCBh
Ym91dCBidW5kbGluZyBhIGRldmljZSB0cmVlIHRoYXQgaGFzIHRoZSBzdXBlcnNldCBvZgpjb21w
b25lbnRzIGFuZCB0aGVuIHVzaW5nIGFuIGluLWtlcm5lbCBkcml2ZXIgdG8gc2V0IHRoZSBzdGF0
dXMgb2YKc29tZSBjb21wb25lbnRzIHRvIG9rYXkgYW5kIHRoZXJlIGlzIHNvbWUgb3ZlcmxhcCB0
aGVyZSBpbiB0aGUKcG9zc2libGUgd2F5IHRvIHJlcHJlc2VudCBib2FyZCB2YXJpYW50cy4gSSB0
aGluayBDaGVuLVl1IGlzIGdvaW5nIHRvCnRhbGsgYWJvdXQgYSBmZXcgb2YgdGhlc2UgdG9waWNz
IG5leHQgbW9udGggYXQgRU9TUyBbMl0uCgpJbiB0ZXJtcyBvZiBsb29raW5nIGF0IHlvdXIgc3Bl
Y2lmaWMgcHJvcG9zYWwsIGl0J3MgZGVmaW5pdGVseSB0cnlpbmcKdG8gZmFjdG9yIGluIGEgbG90
IG1vcmUgdGhpbmdzIHRoYW4gdGhlIGN1cnJlbnQgb25lIHRoYXQgQ2hyb21lYm9va3MKdXNlLiBU
aGUgQ2hyb21lYm9vayBtb2RlbCB3YXMgInNpbXBsZSIgZW5vdWdoIHRoYXQgd2UgY291bGQganVz
dApsZXZlcmFnZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcsIHRob3VnaCB0aGUgd2F5IHdlIGxldmVy
YWdlIGl0IGhhcwplbmRlZCB1cCBjb250cm92ZXJzaWFsIG92ZXIgdGhlIHllYXJzLiBZb3VycyBp
cyBkZWZpbml0ZWx5IHRvbwpjb21wbGljYXRlZCB0byB3b3JrIHRoZSBzYW1lIHdheS4gSXQgc2Vl
bXMgbGlrZSBkZXZpY2UgdHJlZSBvdmVybGF5cwp3b3VsZCBiZSBhIGJldHRlciBmaXQ/IEknbSBu
b3QgYW4gZXhwZXJ0IHNvIG1heWJlIHRoaXMgaXMgYWxyZWFkeQpzb2x2ZWQgc29tZXdoZXJlLCBi
dXQgSSdkIGltYWdpbmUgdGhlIGhhcmQgcGFydCBpcyBnZXR0aW5nIGV2ZXJ5b25lIHRvCmFncmVl
IG9uIGhvdyB0byBzcGVjaWZ5IHN0dWZmIGluIHRoZSBEVCBvdmVybGF5IHRoYXQgYWxsb3dzIHRo
ZQpib290bG9hZGVyIHRvIGtub3cgd2hldGhlciB0byBvdmVybGF5IGl0IG9yIG5vdC4uLgoKWzFd
IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2FyY2gvYXJtL2dvb2dsZS9jaHJvbWVib29rLWJvb3Qt
Zmxvdy5odG1sClsyXSBodHRwczovL2Vvc3MyNC5zY2hlZC5jb20vZXZlbnQvMWFCR2Uvc2Vjb25k
LXNvdXJjZS1jb21wb25lbnQtcHJvYmluZy1vbi1kZXZpY2UtdHJlZS1wbGF0Zm9ybXMtY2hlbi15
dS10c2FpLWdvb2dsZS1sbGMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
