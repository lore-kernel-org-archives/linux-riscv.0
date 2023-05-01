Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B749C77B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RyHGf2NvnrrvdwEVxmXOcd+kJIIoexcA953nvIGSSak=; b=Q+Lmc4BkZW+LMk
	UKLM8PNj5Cw5BmpG0LQRxfdlEMiTGKeZHeVfsIseWAsLxuEyipl+tw9tH/NfVDvXdUtAqUEuQc9cx
	oNWC/AblC5drIIX574VME4XWd8KKlbDmEK1jBozex3gVPpdk4kS3v9QWxbJ6oKoqn49hiwf0Gr22Z
	76ysAYLEbjv7oU5lgAihgqZfc7Aj6g3hM12uwieG2EZ0VyIMv6b4k39VucelKksQUZ66d4DjpV1YS
	whsVE9z2wC1dLOXd5TPCRw8AH7xlQhIosOuYUohe0YM5EX3qjTGx2QNRRKIBHr0DgO/5ZWoH0rGPf
	WRhH5L9GDzPbgszw+4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptirZ-000Fx3-0Q;
	Tue, 02 May 2023 05:47:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptirW-000Fvd-2q
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 05:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:Subject:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tZ9iZX1wsrp4thqDJ5geK1WKKT6d2fHc7Kzcc2RXEDs=; b=VHXmdRet6AannUHyOoB64JnwoS
	n1z1kQKG+yg1A8fRKnFkl7cSa5TfgUPzJ594620lyRyHWXTq2agVaYH0gnMaIqBEZJ7hjwdxb7LfJ
	6sHczujF/VjwQhYjD+Foa0ARszsH3IlwNgEAdkMstUDLLrg9bqPbwTGWgnczGkx/0diejDN+8aWfC
	q2tFrcxqhzrJhUlgu0MblzJbv5WGYg20swpr+nzuotTPvWs1sDpmajQXypkzJbJijAqM5mFmx55M+
	UNlZUQx98LYXjhZeqtAlLeRNO0i4qVvaNBIAyG1+DUaMF0NaiRUEbQIVAbFm2k/3bp32rj+VqvKA6
	kt+IjXqw==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptcIr-00F2Tm-32
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:47:32 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso2621049a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682981245; x=1685573245;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ9iZX1wsrp4thqDJ5geK1WKKT6d2fHc7Kzcc2RXEDs=;
        b=m82VC4CwDmFfnEXgRwYLnn7iGUx82zbqkCIXk7TeatPpsk7VNxZTUND77T8AIk7q6I
         LD2eaJr1d0o3Tr9v6wk6PMq1BHTQSRjBURpvS9Cv6zdE0jeKDcUYyqG7LDa9ibSzsP3f
         wFNppRYwrzhrIydSHsEB43+8bj+T06OZ2NLwaIyzxdzfsnRPX/DaOpWA1iPOH/q8ZTLr
         SdoCHlClqWlT8rGeS/7NZEQIVtBNI6zfngtE/5QA0CjOF4xOAZ2cHiC4PJjHBxSA/3d+
         /dqK1P/jPSBK0qfrgdvx8USIGwNJ5489xzWNac6z4gTo8cqgBvD4aepqOhY7Ef8frQ9h
         tiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981245; x=1685573245;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ9iZX1wsrp4thqDJ5geK1WKKT6d2fHc7Kzcc2RXEDs=;
        b=U94d822cuFln6A+GYA6SwZxylvpP+4j2kJ99m1wbd2sULlB6ROaglXD/cUWG+bi/m1
         Vwz6hzS4haXbfmmce9mNNhhwc+gBnpgaQRpI9eSzX+R99cpdHaVUdk6ft6GqDOzPcDca
         srVzMwpJDoGahy95S7+cAVN2iX9rVXBuhnz6HPmNlN858a1vz8SlVSLk037wYwXQAjQI
         Y5X67sQ5nqXRf9vS9BXGkZrQqkMOsKoqSVP8WmKooOmxjTY7qA5AYW/LgWj95DgWCY0Y
         Fgax66V7Uzi8l6k5q+waKze4nTOFSLDar2zVeLlpsxUSCx3E8ISJAObT4QwAGxr0pmkw
         8eKw==
X-Gm-Message-State: AC+VfDw501uAhxM7XeGOoWbxmGufjEjDt0FDqv5wfb4cn7JRmanqIm5d
	h+dwL3dWFP5xo3MplXemutQ//FHZ2KeFhqq/HSE=
X-Google-Smtp-Source: ACHHUZ4xl5mKxSOqZXLsruvHQFZ+jwmyinjchRLw82jMA/gMbqDPy0slkwIiIDGINw8x22x/5xudEA==
X-Received: by 2002:a17:902:f948:b0:1a6:f0d5:3e21 with SMTP id kx8-20020a170902f94800b001a6f0d53e21mr13430636plb.32.1682981244953;
        Mon, 01 May 2023 15:47:24 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709026b4300b00199193e5ea1sm18373968plt.61.2023.05.01.15.47.24
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:47:24 -0700 (PDT)
Date: Mon, 01 May 2023 15:47:24 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 15:47:02 PDT (-0700)
Subject: Atish is looking at the excessive bouncing
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-f3c5429e-4361-4068-b88c-fb528681881a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_234730_193174_EFDCE1FF 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

We're not sure what happened, but it looks like a lot of people are 
getting dropped from the list due to excessive bounces.  Seems to have 
started recently, possibly today or over the weekend.  We've always had 
some issues with the bounces, but they're a lot worse.

Sorry for the headaches.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
